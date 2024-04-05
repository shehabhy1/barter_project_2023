import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/features/splash_view/presentation/views/widgets/indicator.dart';
import 'package:barter_app/features/splash_view/presentation/views/widgets/on_boarding_buttons.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../data/models/onboarding_model.dart';
import 'widgets/onboarding_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var onBoardingController = PageController();
  bool isLast = false;

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
                    OnBoardingItem(model: screens[0], isLast: isLast),
                    OnBoardingItem(model: screens[1], isLast: isLast),
                  ],
                ),
              ),
              // if statement for sized box
              Indicator(controller: onBoardingController),
              AppButton(
                buttonHeight: 50,
                buttonWidth: 310,
                text: isLast ? 'Login' : 'Next',
                onPressed: () {
                  if (isLast) {
                    submit(context);
                  } else {
                    setState(() {
                      isLast = true;
                    });
                    onBoardingController.nextPage(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.bounceIn,
                    );
                  }
                },
              ),
              SkipButton(
                onBoardingController: onBoardingController,
                isLast: isLast,
                onPressed: () => submit(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    isLast = true;
    CacheHelper.saveBool(key: AppConstants.kOnBoardingView, value: true)
        .then((value) {
      if (value) {
        context.pushReplacementNamed(Routes.loginView);
      }
    });
  }
}
