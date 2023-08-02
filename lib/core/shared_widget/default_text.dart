
import 'package:flutter/material.dart';

import '../../constants.dart';


Widget defaultText({
  TextEditingController? controller ,
  required TextInputType type,
  Function(String)? onChange,
  FormFieldValidator? validate,
  String? label ,
  String? hint ,
  IconData? prefix,
  bool isObscure = false,
  IconData? suffix,
  Function()? pressed,
  Function()? tap,
  bool? enable,


}) => TextFormField(

  onTap: tap,
  enabled: enable,
  controller: controller,
  obscureText: isObscure,
  decoration:  InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: kPrimaryColor),
    hintText: hint,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix!=null ? IconButton(
      onPressed: pressed,
      icon: Icon(
        suffix,
      ),
    )
        : null,
    border: OutlineInputBorder(
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