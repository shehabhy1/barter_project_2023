import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/helper/app_constants.dart';

class Indicator extends StatelessWidget {
  final PageController controller;

  const Indicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SmoothPageIndicator(
        controller: controller,
        count: 2,
        effect: const JumpingDotEffect(
          dotWidth: 9.0,
          dotHeight: 9.0,
          spacing: 8.0,
          activeDotColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
