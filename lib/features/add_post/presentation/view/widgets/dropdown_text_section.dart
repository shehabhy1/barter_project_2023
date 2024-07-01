import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_text_field.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/app_constants.dart';
import '../../../data/model/category_model.dart';
import 'dropdown_button.dart';

class DropdownTextSection extends StatelessWidget {
  const DropdownTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(15),
        Text(
          "Item Name",
          style: AppStyles.medium16.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(15),
        AppTextFiled(
          hint: 'Enter Your Item Name',
          validate: (p0) {},
          controller: TextEditingController(),
          enabledBorder: buildOutlineInputBorder(),
          type: TextInputType.text,
          hintStyle: AppStyles.regularGrey14,
          width: 1,
        ),
        verticalSpace(15),
        Text(
          "Category",
          style: AppStyles.medium16.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(15),
        CustomDropdownButton(menuItems: categoryOptions),
        verticalSpace(15),
        Text(
          "SubCategory",
          style: AppStyles.medium16.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(15),
        CustomDropdownButton(menuItems: categoryOptions),
        verticalSpace(15),
        Text(
          "Description",
          style: AppStyles.medium16.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(15),
        AppTextFiled(
          //Item Name
          hint: 'Enter A Description of Your Item',
          validate: (p0) {},
          controller: TextEditingController(),
          enabledBorder: buildOutlineInputBorder(),
          hintStyle: AppStyles.regularGrey14,
          type: TextInputType.multiline,
          maxLines: 5,
          width: 1,
        ),
        verticalSpace(15),
      ],
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.greyF8.withOpacity(0.6), width: 1),
    borderRadius: BorderRadius.circular(10),
  );
}
