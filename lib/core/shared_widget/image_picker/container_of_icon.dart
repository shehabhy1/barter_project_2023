import 'package:flutter/material.dart';
import '../../helper/app_constants.dart';

class ContainerIcon extends StatelessWidget {
  final IconData? icon;
  const ContainerIcon({super.key, this.icon});

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
