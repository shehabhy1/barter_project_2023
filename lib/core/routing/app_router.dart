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
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:barter_app/features/home/presentation/view/screens/product_details_view.dart';
import 'package:barter_app/features/home/presentation/view_model.dart/cubit/home_cubit.dart';
import 'package:barter_app/features/splash&boarding/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/edit_profile/view_model/update_user_cubit/update_user_cubit.dart';
import '../../features/layout/presentation/view_model/cubit/layout_cubit.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import '../../features/profile_screen/presentation/model_view/cubit/get_user_cubit.dart';
import '../../features/settings/views/settings_view.dart';
import '../../features/splash&boarding/presentation/views/on_boarding_view.dart';
import '../pick_image_cubit/pick_image_cubit.dart';

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
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<RegisterCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<PickImageCubit>(),
                    ),
                  ],
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
                      create: (context) => getIt<GetUserCubit>()..getMyInfo(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<HomeCubit>()..getAllProducts(),
                    ),
                  ],
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
        // final user = arguments as UserData;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<UpdateUserCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<PickImageCubit>(),
                    ),
                  ],
                  child: const EditProfileView(),
                ));

      //settingsView
      case Routes.settingsView:
        return MaterialPageRoute(builder: (_) => const SettingsView());

      //dealStatusView
      case Routes.dealStatusView:
        return MaterialPageRoute(builder: (_) => const DealView());

      // productDetailsView
      case Routes.productDetailsView:
        final productDetails = arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsView(product: productDetails),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route define for ${settings.name}')),
          ),
        );
    }
  }
}
