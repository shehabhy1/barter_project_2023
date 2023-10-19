import 'package:flutter/material.dart';

void navigateTo(
  context,
  widget,
) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Future<void> navigateAndFinish(
  context,
  widget,
) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
