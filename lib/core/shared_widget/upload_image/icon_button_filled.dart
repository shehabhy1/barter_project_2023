import 'package:flutter/material.dart';

import '../../helper/app_constants.dart';

class CustomIconFilled extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  const CustomIconFilled(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          AppColors.primaryColor.withOpacity(0.7),
        ),
      ),
      icon: Icon(icon, color: Colors.white),
    );
  }
}
