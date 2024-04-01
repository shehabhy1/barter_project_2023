import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/cache_helper.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({
    super.key,
    required this.onBoardingController,
    required this.isLast,
  });
  final PageController onBoardingController;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 310.w,
          decoration: BoxDecoration(
              color: Constants.primaryColor,
              borderRadius: BorderRadius.circular(8)),
          //TODO: راجع التصميم مع فيجما  => شهاب
          child: TextButton(
            onPressed: () {
              if (isLast) {
                submit(context);
              } else {
                onBoardingController.nextPage(
                    duration: const Duration(microseconds: 750),
                    curve: Curves.bounceIn);
              }
            },
            child: Text(
              isLast ? 'login' : 'Next',
              style: Styles.textStyle20.copyWith(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: 310.w,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Constants.primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: () {
              submit(context);
            },
            child: Text(
              'Skip',
              style: Styles.textStyle20.copyWith(color: Constants.primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  void submit(BuildContext context) {
    //save data in shared pref
    CacheHelper.saveBool(key: Constants.kOnBoardingView, value: true).then(
      (value) {
        if (value) {
          context.pushReplacementNamed(Routes.loginView);
        }
      },
    );
  }
}
