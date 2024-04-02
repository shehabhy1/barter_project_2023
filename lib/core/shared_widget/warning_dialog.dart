import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/app_constants.dart';
import '../utils/styles.dart';

class AppErrors {
  // static Future<void> showWarningDialog({
  //   required BuildContext context,
  //   required String subtitle,
  //   required void Function()? onTap,
  //   bool isError = true,
  // }) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12.0),
  //         ),
  //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Image.asset(
  //               AppAssets.warning,
  //               height: 50.h,
  //               width: 50.w,
  //             ),
  //             const SizedBox(height: 16),
  //             TextWidget(
  //               label: subtitle,
  //               fontWeight: FontWeight.w600,
  //             ),
  //             const SizedBox(height: 16),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Visibility(
  //                   visible: !isError,
  //                   child: TextButton(
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     child: const TextWidget(
  //                       label: "Cancel",
  //                       color: Colors.green,
  //                     ),
  //                   ),
  //                 ),
  //                 TextButton(
  //                   onPressed: onTap,
  //                   child: const TextWidget(
  //                     label: "OK",
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );

  // }

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
          style: Styles.textStyle14,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Got it',
              style: Styles.textStyle16,
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
            fontSize: 15.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
