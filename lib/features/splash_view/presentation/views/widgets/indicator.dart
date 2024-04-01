import 'package:barter_app/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/helper/constants.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.controller,
    required this.onBordingList,
  });

  final PageController controller;
  final List<OnBoardingModel> onBordingList;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onBordingList.length,
      effect: const JumpingDotEffect(
          dotWidth: 9.0,
          dotHeight: 9.0,
          spacing: 8.0,
          activeDotColor: Constants.primaryColor),
    );
  }
}
