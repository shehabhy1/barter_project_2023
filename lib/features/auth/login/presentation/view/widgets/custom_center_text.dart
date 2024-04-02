import 'package:flutter/material.dart';
import '../../../../../../core/utils/styles.dart';

class CustomCenterText extends StatelessWidget {
  final String text;
  const CustomCenterText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Text(
          text,
          style: Styles.textStyle32,
        ),
      ),
    );
  }
}
