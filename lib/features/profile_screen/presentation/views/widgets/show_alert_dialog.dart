import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/helper/cache_helper.dart';
import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/shared_widget/componets.dart';
import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/auth_screens/log_in/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowAlertDialog extends StatefulWidget {
  const ShowAlertDialog({
    super.key,
  });

  @override
  State<ShowAlertDialog> createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
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
                        style: Styles.textStyle16
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
                            style: Styles.textStyle16
                                .copyWith(color: const Color(0xff626262)),
                          )),
                      TextButton(
                          onPressed: () {
                            //TODO: log out by remove id from shared pref
                            CacheHelper.removeData(key: Constant.kUserToken)
                                .then((value) => {
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView(),))
                                    });
                            setState(() {});
                          },
                          child: Text(
                            'LogOut',
                            style:
                                Styles.textStyle16.copyWith(color: Colors.red),
                          )),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ));
        },
        child: Text(
          'Logout',
          style: Styles.textStyle20.copyWith(color: Colors.black),
        ));
  }
}
