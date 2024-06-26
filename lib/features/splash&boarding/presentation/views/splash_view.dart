import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/app_constants.dart';
import '../../../../core/helper/cash_helper/cache_helper.dart';
import '../../../../core/helper/cash_helper/cash_helper_constants.dart';
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
    onBoarding =
        CashHelper.getData(key: CashConstants.kOnBoardingView) ?? false;
    isLogin = CashHelper.getData(key: CashConstants.userToken) ?? "";
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
    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacementNamed(
        onBoarding == true
            ? isLogin == ""
                ? Routes.loginView
                : Routes.layoutView
            : Routes.onBoardingView,
      );
    });
  }
}
