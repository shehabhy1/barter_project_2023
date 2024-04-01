import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/verify_reset_code_body.dart';
import 'package:flutter/material.dart';

class VerifyResetCodeView extends StatelessWidget {
  const VerifyResetCodeView({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: VerifyResetCodeBody(
          email: email,
        ),
      ),
    );
  }
}
