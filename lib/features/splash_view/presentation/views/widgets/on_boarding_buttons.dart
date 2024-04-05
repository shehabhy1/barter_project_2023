import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/app_constants.dart';

class SkipButton extends StatelessWidget {
  final PageController onBoardingController;
  final bool isLast;
  final void Function()? onPressed;
  const SkipButton({
    super.key,
    required this.onBoardingController,
    required this.isLast,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: 310.w,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppConstants.primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              'Skip',
              style: AppStyles.semiBold20
                  .copyWith(color: AppConstants.primaryColor),
            ),
          ),
        ),
        verticalSpace(40),
      ],
    );
  }
}
