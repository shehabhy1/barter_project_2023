import 'package:flutter/material.dart';

import '../log_in/presentation/views/signup_view.dart';

class LastLine extends StatelessWidget {
  const LastLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don \'t have an account ?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF767474),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupView(),
              ),
            );
          },
          child: const Text(
            'SIGN UP ',
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
