import 'package:barter_project_2023/features/log_in/presentation/views/widgets/pass_body.dart';
import 'package:flutter/material.dart';

class PassView extends StatelessWidget {
  const PassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: PassBody(),
      ),
    );
  }
}
