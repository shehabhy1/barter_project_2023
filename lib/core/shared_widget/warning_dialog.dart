import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/app_constants.dart';
import '../utils/styles.dart';

class AppWarning {
  static void logoutDialog({
    required BuildContext context,
    required String tittle,
    required void Function()? onTap,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tittle,
                style: AppStyles.regularBlack16,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: AppStyles.regularBlack16.copyWith(
                        color: const Color(0xff626262),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onTap,
                    child: Text(
                      'Logout',
                      style: AppStyles.regularBlack16.copyWith(
                        color: const Color(0xffBA1A1A),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showAwesomeDialog({
    required BuildContext context,
    required String title,
    String? desc,
    required DialogType dialogType,
    //required void Function()? onTap,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.topSlide,
      title: title,
      desc: desc,
      descTextStyle: AppStyles.regularGrey16,
      dialogBackgroundColor: Colors.white,
    ).show();
  }

  static void customErrorWidget(BuildContext context, String error) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: AppStyles.regularGrey16,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Got it',
              style: AppStyles.medium16,
            ),
          ),
        ],
      ),
    );
  }

  static void snackBarState(BuildContext context, String error) {
    // context.pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: AppConstants.primaryColor,
        content: Text(
          error,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp, fontWeight: FontWeight.w500,
            //color: Colors.black,
          ),
        ),
      ),
    );
  }

  static void dialogErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'close',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
