import 'package:barter_app/core/helper/cash_helper/cache_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/cash_helper/cash_helper_constants.dart';
import 'widgets/profile_screen_widgets/profile_signup.dart';
import 'widgets/profile_screen_widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CachHelper.getData(key: CashConstants.userToken) == null
        ? const ProfileSignup()
        : const SafeArea(child: ProfileViewBody());
  }
}
