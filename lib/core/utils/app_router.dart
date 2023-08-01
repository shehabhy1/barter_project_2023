import 'package:barter_project_2023/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash_view/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const pOnBoardingView = '/onBoardingView';
  static const kOnBoardingView = 'onBoardingView';
  static final rout = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: kOnBoardingView,
        path: pOnBoardingView,
        builder: (context, state) => const OnBoadingView(),
      ),
    ],
  );
}
