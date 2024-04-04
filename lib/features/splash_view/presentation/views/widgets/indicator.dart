import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/helper/app_constants.dart';
import '../../../data/models/onboarding_model.dart';

class Indicator extends StatelessWidget {
  final PageController controller;
  final List<OnBoardingModel> onBordingList;

  const Indicator({
    super.key,
    required this.controller,
    required this.onBordingList,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onBordingList.length,
      effect: const JumpingDotEffect(
        dotWidth: 9.0,
        dotHeight: 9.0,
        spacing: 8.0,
        activeDotColor: AppConstants.primaryColor,
      ),
    );
  }
}
