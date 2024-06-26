import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/styles.dart';

class AppButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  const AppButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    required this.text,
    this.textStyle,
    required this.onPressed,
    this.textColor,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle ??
          ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 8))),
            backgroundColor: WidgetStateProperty.all(
                backgroundColor ?? AppColors.primaryColor),
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            fixedSize: WidgetStateProperty.all(Size(
                buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h)),
          ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: AppStyles.semiBold20
              .copyWith(fontSize: 22, color: AppColors.white),
        ),
      ),
    );
  }
}
