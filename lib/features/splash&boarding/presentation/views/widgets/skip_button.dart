import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/app_constants.dart';
import '../../../../../core/utils/styles.dart';

class SkipButton extends StatelessWidget {
  final void Function()? onPressed;
  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Skip',
          style: AppStyles.semiBold20.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
