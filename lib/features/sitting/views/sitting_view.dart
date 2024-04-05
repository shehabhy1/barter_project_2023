import 'package:flutter/material.dart';

import 'widget/sitting_view_body.dart';

class SittingView extends StatelessWidget {
  const SittingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SittingViewBody(),
      ),
    );
  }
}
