import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/reset_pass_body.dart';
import 'package:flutter/material.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResetPassBody(
          email: email,
        ),
      ),
    );
  }
}
