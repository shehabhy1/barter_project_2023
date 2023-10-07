import 'package:barter_project_2023/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String messege}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(messege)),
    backgroundColor: kPrimaryColor,
    duration: const Duration(seconds: 2),
  ));
}
