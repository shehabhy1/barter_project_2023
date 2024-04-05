import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: SizedBox(
                      width: context.deviceWidth,
                      child: Text(
                        'Do you want to logout?',
                        style: AppStyles.medium16
                            .copyWith(color: const Color(0xff626262)),
                      ),
                    ),
                    insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            'Cancel',
                            style: AppStyles.medium16
                                .copyWith(color: const Color(0xff626262)),
                          )),
                      TextButton(
                          onPressed: () {
                            // CacheHelper.removeData(key: Constants.kUserToken);
                          },
                          child: Text(
                            'LogOut',
                            style:
                                AppStyles.medium16.copyWith(color: Colors.red),
                          )),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ));
        },
        child: Text(
          'Logout',
          style: AppStyles.semiBold20.copyWith(color: Colors.black),
        ));
  }
}
