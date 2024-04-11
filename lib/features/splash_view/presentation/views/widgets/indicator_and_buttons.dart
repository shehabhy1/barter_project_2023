import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/features/splash_view/presentation/views/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/cash_helper/cash_helper_constants.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/shared_widget/app_buttom.dart';
import '../../../../../core/helper/cash_helper/cache_helper.dart';
import 'indicator.dart';

// ignore: must_be_immutable
class IndicatorAndButtons extends StatefulWidget {
  final PageController onBoardingController;
  int currentIndex;

  IndicatorAndButtons({
    super.key,
    required this.onBoardingController,
    required this.currentIndex,
  });

  @override
  State<IndicatorAndButtons> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<IndicatorAndButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Indicator(controller: widget.onBoardingController),
        AppButton(
          buttonHeight: 50,
          buttonWidth: 310,
          text: widget.currentIndex == 0 ? 'Next' : 'Login',
          onPressed: () {
            setState(() {
              ++widget.currentIndex;
            });
            if (widget.currentIndex < 2) {
              widget.onBoardingController.nextPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
              );
            } else {
              toLogin(context);
            }
          },
        ),
        const SizedBox(height: 20),
        SkipButton(onPressed: () => toLogin(context)),
        verticalSpace(40),
      ],
    );
  }

  void toLogin(BuildContext context) {
    CachHelper.putData(key: CashConstants.kOnBoardingView, value: true);
    context.pushNamedAndRemoveUntil(Routes.loginView,
        predicate: (Route<dynamic> route) => false);
  }
}
