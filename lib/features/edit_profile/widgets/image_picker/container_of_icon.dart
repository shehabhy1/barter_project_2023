import 'package:flutter/material.dart';
import '../../../../../../../core/helper/app_constants.dart';

class FilledIcon extends StatelessWidget {
  final IconData? icon;
  const FilledIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            AppConstants.primaryColor.withOpacity(0.75)),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
