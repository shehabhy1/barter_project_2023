import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/forget_pass_body.dart';
import 'package:flutter/material.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ForgetPassBody()),
    );
  }
}
