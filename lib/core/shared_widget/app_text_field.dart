import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFiled extends StatelessWidget {
  // final String? Function(String?)? validator,
  final TextEditingController? controller;
  final TextInputType type;
  final Function(String)? onChange;
  final FormFieldValidator? validate;
  final String? label;
  final String? hint;
  final Widget? sufficIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final IconData? suffix;
  final Function()? pressed;
  final Function()? tap;
  final bool? enable;
  final bool? readOnly;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final BoxConstraints? prefixIconConstraints;
  const AppTextFiled({
    super.key,
    required this.type,
    this.controller,
    this.onChange,
    this.validate,
    this.label,
    this.hint,
    this.sufficIcon,
    this.prefixIcon,
    this.suffix,
    this.pressed,
    this.tap,
    this.enable,
    this.readOnly,
    this.maxLines,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.isObscure = false,
    this.prefixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      controller: controller,
      onTap: tap,
      onChanged: onChange,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: sufficIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        labelStyle: const TextStyle(color: AppConstants.primaryColor),
        enabledBorder:
            enabledBorder ?? buildOutlineInputBorder(AppConstants.greyColor),
        focusedBorder: focusedBorder ??
            buildOutlineInputBorder(AppConstants.primaryColor, width: 2),
        errorBorder: buildOutlineInputBorder(AppConstants.red),
        focusedErrorBorder: buildOutlineInputBorder(AppConstants.red),
      ),
      enabled: enable,
      validator: validate,
      obscureText: isObscure,
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
        borderRadius: BorderRadius.circular(10));
  }
}
