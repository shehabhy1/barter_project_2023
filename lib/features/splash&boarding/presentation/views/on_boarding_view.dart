import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import '../../data/models/onboarding_model.dart';
import 'widgets/indicator_and_buttons.dart';
import 'widgets/onboarding_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var onBoardingController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    onBoardingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(100),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  padEnds: false,
                  controller: onBoardingController,
                  children: [
                    OnBoardingItem(model: screens[0], isLast: false),
                    OnBoardingItem(model: screens[1], isLast: true),
                  ],
                ),
              ),
              IndicatorAndButtons(
                onBoardingController: onBoardingController,
                currentIndex: currentIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
