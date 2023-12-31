// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:barter_project_2023/features/splash_view/presentation/views/widgets/indicator.dart';
import 'package:barter_project_2023/features/splash_view/presentation/views/widgets/on_boarding_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

String onBoardingDescription =
    'where you can exchange goods and services with ease. Let our app connect you with a community of like-minded individuals and open up a world of possibilities!';

class _OnBoardingViewState extends State<OnBoardingView> {
  var onBoardingController = PageController();
  List<OnBoardingModel> screens = [
    OnBoardingModel(
        image: AssetData.onboardingImage1, description: onBoardingDescription),
    OnBoardingModel(image: AssetData.onboardingImage2),
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
              SizedBox(height: 100.h),
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
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: isLast
                            ? Container()
                            : Text(
                                screens[index].description!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF8B8B8B),
                                ),
                              ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ),
              Indicator(
                  controller: onBoardingController, onBordingList: screens),
              // if statement for sized box
              const SizedBox(height: 15),
              //TODO: راجع التصميم مع فيجما  => شهاب

              OnBoardingButtons(
                onBoardingController: onBoardingController,
                isLast: isLast,
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingModel {
  String? image;
  String? description;
  OnBoardingModel({
    this.image,
    this.description,
  });
}
