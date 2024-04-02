import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

class LastLineSign extends StatelessWidget {
  const LastLineSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Have an account ?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF767474),
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.loginView);
          },
          child: const Text(
            'Log in ',
            style: TextStyle(
              color: Color(0xFFB73BFF),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
