import 'package:barter_project_2023/features/log_in/presentation/views/widgets/verify_pass.dart';
import 'package:flutter/material.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: VerifyPass(),
      ),
    );
  }
}
