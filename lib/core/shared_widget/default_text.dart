import 'package:flutter/material.dart';

import '../helper/app_constants.dart';

// default text form field you should name it like this

Widget defaultText({
  // final String? Function(String?)? validator,
  TextEditingController? controller,
  required TextInputType type,
  Function(String)? onChange,
  FormFieldValidator? validate,
  String? label,
  String? hint,
  Widget? sufficIcon,
  IconData? prefix,
  bool isObscure = false,
  IconData? suffix,
  Function()? pressed,
  Function()? tap,
  bool? enable,
  bool? readOnly,
}) =>
    TextFormField(
      readOnly: readOnly ?? false,
      onTap: tap,
      enabled: enable,
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppConstants.primaryColor),
        hintText: hint,
        prefixIcon: Icon(prefix),
        suffixIcon: sufficIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppConstants.primaryColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      keyboardType: type,
      onChanged: onChange,
      validator: validate,
    );
