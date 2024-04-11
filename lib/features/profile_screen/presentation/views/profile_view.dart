import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import 'widgets/profile_screen_widgets/profile_signup.dart';
import 'widgets/profile_screen_widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: AppConstants.kUserToken) == null
        ? const ProfileSignup()
        : const SafeArea(child: ProfileViewBody());
  }
}
