import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final Function(String)? onChange;
  final Function(String?)? validate;
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
  final FocusNode? focusNode;
  final void Function(String?)? onSubmitted;
  const AppTextFiled({
    super.key,
    required this.type,
    this.validate,
    this.controller,
    this.onChange,
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
    this.focusNode,
    this.isObscure = false,
    this.prefixIconConstraints,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      focusNode: focusNode,
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
        labelStyle: const TextStyle(color: AppColors.primaryColor),
        enabledBorder:
            enabledBorder ?? buildOutlineInputBorder(AppColors.greyColor),
        focusedBorder: focusedBorder ??
            buildOutlineInputBorder(AppColors.primaryColor, width: 2),
        errorBorder: buildOutlineInputBorder(AppColors.red),
        focusedErrorBorder: buildOutlineInputBorder(AppColors.red),
      ),
      enabled: enable,
      validator: (value) {
        return validate!(value);
      },
      obscureText: isObscure,
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
        borderRadius: BorderRadius.circular(10));
  }
}
