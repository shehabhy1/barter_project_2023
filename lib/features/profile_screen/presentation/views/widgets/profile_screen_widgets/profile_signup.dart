import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/routing/routes.dart';

class ProfileSignup extends StatelessWidget {
  const ProfileSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "You are not logged in, Please login to access this route",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
