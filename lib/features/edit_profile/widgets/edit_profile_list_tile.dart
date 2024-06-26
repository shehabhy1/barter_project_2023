import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/app_constants.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';
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
        style: AppStyles.medium18
            .copyWith(color: const Color(0xff7301B5), fontSize: 18.sp),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(widget.subTitle, style: AppStyles.regularGrey16),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          AssetData.editTextIcon,
          width: 25,
          height: 44,
          color: AppColors.greyColor,
        ),
      ),
    );
  }
}
