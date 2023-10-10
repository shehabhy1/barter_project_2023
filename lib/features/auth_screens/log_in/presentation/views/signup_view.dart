import 'package:flutter/material.dart';

import '../../../widgets/signup_body.dart';

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
