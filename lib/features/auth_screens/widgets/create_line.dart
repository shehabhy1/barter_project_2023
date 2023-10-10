import 'package:flutter/material.dart';

import '../log_in/presentation/views/login_view.dart';

class LastLineSign extends StatelessWidget {
  const LastLineSign({Key? key}) : super(key: key);

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
            );
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
