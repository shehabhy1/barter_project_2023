import 'package:flutter/material.dart';

import '../utils/styles.dart';

buildAppBar(
    {required String title, TextStyle? style, void Function()? onPressed}) {
  return AppBar(
    surfaceTintColor: Colors.white,
    //backgroundColor: Colors.white,
    //backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0.0,
    centerTitle: true,
    title: Text(
      title,
      style: style ?? AppStyles.medium24,
    ),
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
  );
}
