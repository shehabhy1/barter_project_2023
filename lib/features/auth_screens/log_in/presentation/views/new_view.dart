import 'package:flutter/material.dart';

import '../../../widgets/new_body.dart';

class NewPass extends StatelessWidget {
  const NewPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: NewPassBody(),
      ),
    );
  }
}
