import 'package:barter_project_2023/features/log_in/presentation/views/widgets/new_body.dart';
import 'package:flutter/material.dart';

class NewPass extends StatelessWidget {
  const NewPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NewPassBody() ,
      ),
    );
  }
}
