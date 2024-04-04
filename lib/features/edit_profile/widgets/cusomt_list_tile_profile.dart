import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';

class CustomListTileProfile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? trailing;
  const CustomListTileProfile({
    super.key,
    required this.title,
    required this.subTitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppConstants.primaryColor,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          fontSize: 16,
          color: AppConstants.greyColor,
        ),
      ),
      trailing: Image.asset(
        AssetData.editTextIcon,
        width: 25,
        height: 44,
        color: AppConstants.greyColor,
      ),
    );
  }
}
