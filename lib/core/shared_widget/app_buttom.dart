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
  final VoidCallback func;
  final ButtonStyle? buttonStyle;
  const AppButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      this.buttonHeight,
      required this.text,
      this.textStyle,
      required this.func,
      this.textColor,
      this.buttonStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle ??
          ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 8))),
            backgroundColor: MaterialStateProperty.all(
                backgroundColor ?? AppConstants.primaryColor),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            fixedSize: MaterialStateProperty.all(Size(
                buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 55.h)),
          ),
      onPressed: func,
      child: Center(
        child: Text(
          text,
          style: AppStyles.semiBold20
              .copyWith(fontSize: 24, color: AppConstants.white),
        ),
      ),
    );
  }
}
