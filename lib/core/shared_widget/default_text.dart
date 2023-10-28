import 'package:flutter/material.dart';

import '../../constants.dart';

// default text form field you should name it like this

Widget defaultTextField({
  TextEditingController? controller,
  required TextInputType type,
  Function(String)? onChange,
  FormFieldValidator? validate,
  String? label,
  void Function(String)? onFieldSubmitted,
  bool autofocus = false,
  String? hint,
  IconData? prefix,
  bool isObscure = false,
  IconData? suffix,
  int? maxLines,
  Function()? pressed,
  Function()? tap,
  EdgeInsetsGeometry? padding,
  InputBorder? border,
  bool? enable,
  Color background = Colors.purple,
}) =>
    TextFormField(
      autofocus: autofocus,
      onTap: tap,
      enabled: enable,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      maxLines: maxLines ?? 1,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: hint,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        contentPadding: padding,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: pressed,
                icon: Icon(
                  suffix,
                  color: background,
                ),
              )
            : null,
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      keyboardType: type,
      onChanged: onChange,
      validator: validate,
    );
