// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/features/splash_view/presentation/views/widgets/indicatour.dart';
import 'package:barter_project_2023/features/splash_view/presentation/views/widgets/on_boarding_buttons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

String onBoardingDesc =
    'where you can exchange goods and services with ease. Let our app connect you with a community of like-minded individuals and open up a world of possibilities!';

class _OnBoardingViewState extends State<OnBoardingView> {
  var onBoardingController = PageController();
  List<OnBoardingModel> screens = [
    OnBoardingModel(image: Constant.onboardingImage1, desc: onBoardingDesc),
    OnBoardingModel(image: Constant.onboardingImage2, desc: ''),
  ];
  bool isLast = false;
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
              SizedBox(height: 15.h),
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
                            ? Container()
                            : Text(
                                screens[index].desc!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF8B8B8B),
                                ),
                              ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              Indicator(
                  controller: onBoardingController, onBordingList: screens),
              const SizedBox(height: 15),
              //     //TODO: راجع التصميم مع فيجما  => شهاب

              OnBoardingButtons(
                onBoardingController: onBoardingController,
                isLast: isLast,
              ),

              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingModel {
  String? image;
  String? desc;
  OnBoardingModel({
    this.image,
    this.desc,
  });
}
