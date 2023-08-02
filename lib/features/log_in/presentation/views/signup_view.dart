import 'package:barter_project_2023/features/log_in/presentation/views/widgets/signup_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignupBody(),
      ),
    );
  }
}
