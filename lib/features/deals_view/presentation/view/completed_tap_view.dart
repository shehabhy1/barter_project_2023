import 'package:flutter/material.dart';

class CompletedTap extends StatelessWidget {
  const CompletedTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.access_time_filled)],
    );
  }
}
