import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/di/injection.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/forget_pass_view.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/reset_pass_view.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/verify_reset_code_view.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/edit_profile/edit_profile_view.dart';
import 'package:barter_app/features/layout/presentation/view_model/cubit/layout_cubit.dart';
import 'package:barter_app/features/layout/presentation/views/layout.dart';
import 'package:barter_app/features/auth/login/presentation/view/login_view.dart';
import 'package:barter_app/features/auth/register/presentation/view/register_view.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:barter_app/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:barter_app/features/splash_view/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/sitting/views/sitting_view.dart';

class AppRouter {
  bool isLast = CacheHelper.getData(key: AppConstants.kOnBoardingView) ?? false;
  Route generatRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.routingSplashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  //child: const OnBoardingView(),
                  child: isLast ? const LoginView() : const OnBoardingView(),
                ));
      case Routes.loginView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginView(),
                ));
      case Routes.registerView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<RegisterCubit>(),
                  child: const RegisterView(),
                ));
      case Routes.layoutView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LayoutCubit>(),
                  child: const LayoutView(),
                ));

      case Routes.verifyView:
        final email = arguments as TextEditingController;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ForgetPassCubit>.value(
            value: getIt<ForgetPassCubit>(),
            child: VerifyResetCodeView(
              email: email.text,
            ),
          ),
        );
      case Routes.forgetPassView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ForgetPassCubit>.value(
                  value: getIt<ForgetPassCubit>(),
                  child: const ForgetPassView(),
                ));

      case Routes.resetPassView:
        final email = arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ForgetPassCubit>.value(
                  value: getIt<ForgetPassCubit>(),
                  child: ResetPassView(
                    email: email,
                  ),
                ));
      case Routes.editProfileView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ProfileCubit>.value(
                  value: getIt<ProfileCubit>(),
                  child: const EditProfileView(),
                ));
      case Routes.settingsView:
        return MaterialPageRoute(builder: (_) => const SittingView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route define for ${settings.name}')),
          ),
        );
    }
  }
}
