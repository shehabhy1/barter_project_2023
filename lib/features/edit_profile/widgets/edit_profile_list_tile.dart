import 'package:flutter/material.dart';

import '../../../core/helper/app_constants.dart';
import '../../../core/utils/assets.dart';
import 'cusomt_list_tile_profile.dart';

class EditProfileListTile extends StatelessWidget {
  final CustomListTileProfile widget;
  final void Function()? onTap;

  const EditProfileListTile({super.key, required this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff7301B5),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          widget.subTitle,
          style: const TextStyle(
            fontSize: 16,
            color: AppConstants.greyColor,
          ),
        ),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          AssetData.editTextIcon,
          width: 25,
          height: 44,
          color: AppConstants.greyColor,
        ),
      ),
    );
  }
}
