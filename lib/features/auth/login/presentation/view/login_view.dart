import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Align(
              alignment: const Alignment(-1, 0.5),
              child: SvgPicture.asset(
                AssetData.authLeft,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor.withOpacity(0.2),
                  BlendMode.srcIn,
                ),
              )),
          Align(
              alignment: const Alignment(1, -0.5),
              child: SvgPicture.asset(
                AssetData.authRight,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor.withOpacity(0.2),
                  BlendMode.srcIn,
                ),
              )),
          const LoginBody(),
        ],
      )),
    );
  }
}
