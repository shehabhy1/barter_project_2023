import 'package:barter_app/features/layout/presentation/view_model/cubit/layout_cubit.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/login/presentation/view/login_view.dart';
import '../../features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import '../../features/splash_view/presentation/views/on_boarding_view.dart';
import '../di/injection.dart';
import '../helper/app_constants.dart';
import '../utils/cache_helper.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLast =
        CacheHelper.getData(key: AppConstants.kOnBoardingView) ?? false;
    String userSignIn = CacheHelper.getData(key: AppConstants.kUserToken) ?? "";
    return isLast
        ? userSignIn == ""
            ? BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginView(),
              )
            : MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => getIt<ProfileCubit>()..getMyInfo(),
                  ),
                  BlocProvider(
                    create: (context) => getIt<LayoutCubit>(),
                  ),
                ],
                child: const LayoutView(),
              )
        : const OnBoardingView();
  }
}
