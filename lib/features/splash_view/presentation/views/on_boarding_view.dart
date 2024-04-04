import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/features/splash_view/presentation/views/widgets/indicator.dart';
import 'package:barter_app/features/splash_view/presentation/views/widgets/on_boarding_buttons.dart';
import 'package:flutter/material.dart';
import '../../data/models/onboarding_model.dart';

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
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    if (value == screens.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                      debugPrint(" ${isLast.toString()}");
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  controller: onBoardingController,
                  itemCount: screens.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.asset(
                        screens[index].image!,
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: isLast
                            ? const SizedBox.shrink()
                            : Text(
                                screens[index].description!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF8B8B8B),
                                ),
                              ),
                      ),
                      verticalSpace(15),
                    ],
                  ),
                ),
              ),
              Indicator(
                controller: onBoardingController,
                onBordingList: screens,
              ),
              // if statement for sized box
              const SizedBox(height: 15),
              OnBoardingButtons(
                onBoardingController: onBoardingController,
                isLast: isLast,
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
