import 'package:barter_project_2023/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                Constant.splashImage,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 32.h,
              child: Image.asset(
                Constant.logo,
                width: 56.w,
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 3500), () {
      context.pushReplacementNamed(AppRouter.kOnBoardingView);
    });
  }
}
