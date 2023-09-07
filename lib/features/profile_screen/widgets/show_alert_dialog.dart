import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                          onPressed: () {},
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
