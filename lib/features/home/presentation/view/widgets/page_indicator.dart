import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constants.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      axisDirection: Axis.horizontal,
      effect:  const SlideEffect(
          spacing:  8.0,
          radius:  6.0,
          dotWidth:  12.0,
          dotHeight:  12.0,
          paintStyle:  PaintingStyle.stroke,
          strokeWidth:  1.5,
          dotColor:  Colors.grey,
          activeDotColor:  Constant.primaryColor
      ),
    );
  }
}