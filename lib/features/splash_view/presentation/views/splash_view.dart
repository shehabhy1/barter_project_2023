import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

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
                fit: BoxFit.cover,
                AssetData.splashImage,
                width: context.deviceWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Positioned(
              // bottom: context.deviceHeight*.41,
              child: Image.asset(
                AssetData.logo,
                width: context.deviceWidth * 0.5,
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 3500), () {
      context.pushReplacementNamed(Routes.loginView);
    });
  }
}
