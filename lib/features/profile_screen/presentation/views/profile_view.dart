import 'package:barter_app/core/di/injection.dart';
import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:barter_app/features/profile_screen/presentation/views/widgets/profile_screen_widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getMyInfo(),
      child: CacheHelper.getData(key: AppConstants.kUserToken) == null
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "You are not logged in, Please login to access this route",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: context.deviceWidth * .5,
                    child: ElevatedButton(
                        onPressed: () {
                          context.pushNamed(Routes.loginView);
                        },
                        child: const Text('Login')),
                  )
                ],
              ),
            )
          : const ProfileViewBody(),
    );
  }
}
