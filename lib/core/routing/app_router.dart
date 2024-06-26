import 'package:barter_app/core/di/injection.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/forget_pass_view.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/reset_pass_view.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/verify_reset_code_view.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/deals_view/presentation/view/deal_view.dart';
import 'package:barter_app/features/edit_profile/edit_profile_view.dart';
import 'package:barter_app/features/auth/login/presentation/view/login_view.dart';
import 'package:barter_app/features/auth/register/presentation/view/register_view.dart';
import 'package:barter_app/features/profile_screen/data/models/user_info_model.dart';
import 'package:barter_app/features/splash&boarding/presentation/views/on_boarding_view.dart';
import 'package:barter_app/features/splash&boarding/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/layout/presentation/view_model/cubit/layout_cubit.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import '../../features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import '../../features/sitting/views/sitting_view.dart';

class AppRouter {
  Route generatRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.routingSplashView:
        return MaterialPageRoute(builder: (_) => const SplashView());

      //onBoardingView
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      //loginView
      case Routes.loginView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginView(),
                ));

      //registerView
      case Routes.registerView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<RegisterCubit>(),
                  child: const RegisterView(),
                ));

      //layoutView
      case Routes.layoutView:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<LayoutCubit>(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          getIt<GetProfileCubit>()..getMyInfo(),
                    ),
                  ],
                  child: const LayoutView(),
                ));

      //verifyView
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

      //forgetPassView
      case Routes.forgetPassView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ForgetPassCubit>.value(
                  value: getIt<ForgetPassCubit>(),
                  child: const ForgetPassView(),
                ));

      //resetPassView
      case Routes.resetPassView:
        final email = arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<ForgetPassCubit>.value(
                  value: getIt<ForgetPassCubit>(),
                  child: ResetPassView(email: email),
                ));

      //editProfileView
      case Routes.editProfileView:
        final user = arguments as UserData;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<GetProfileCubit>(),
                  child: EditProfileView(userData: user),
                ));

      //settingsView
      case Routes.settingsView:
        return MaterialPageRoute(builder: (_) => const SittingView());

      //dealStatusView
      case Routes.dealStatusView:
        return MaterialPageRoute(builder: (_) => const DealView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route define for ${settings.name}')),
          ),
        );
    }
  }
}
