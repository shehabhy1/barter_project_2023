import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/login_view.dart';
import 'package:barter_project_2023/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash_view/presentation/views/splash_view.dart';

bool isLast = CacheHelper.getData(key: Constant.kOnBoardingView) ?? false;

class AppRouter {
  static const kSplashView = '/';
  static const pOnBoardingView = '/onBoardingView';
  static const kOnBoardingView = 'onBoardingView';
  static const kloginView = 'loginView';
  static const ploginView = '/loginView';

  static final rout = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
          name: kOnBoardingView,
          path: pOnBoardingView,
          builder: (context, state) =>
              isLast ? const LoginView() : const OnBoardingView()),
      GoRoute(
        name: kloginView,
        path: ploginView,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
