import 'package:flutter/material.dart';
import '../../../../../../core/utils/styles.dart';

class CustomCenterText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CustomCenterText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Text(
          text,
          style: style ?? AppStyles.bold32,
        ),
      ),
    );
  }
}
