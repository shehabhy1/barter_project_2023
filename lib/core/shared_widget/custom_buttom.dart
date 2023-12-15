import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.borderRadius,
    required this.text,
    this.fontSized,
    required this.onPressed,
    this.width,
    this.height = 48,
  });
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? fontSized;
  final String text;

  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            // minimumSize: const Size(double.infinity, 0),
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            // minimumSize: Size(150, 50),
          ),
          child: Text(
            text,
            style: Styles.textStyle20.copyWith(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
