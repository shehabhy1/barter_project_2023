import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/styles.dart';

class CheckUserLogin extends StatelessWidget {
  const CheckUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "You are not logged in, Please login to access this route",
            style: AppStyles.semiBold20.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: context.deviceWidth * .5,
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(Routes.loginView);
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
