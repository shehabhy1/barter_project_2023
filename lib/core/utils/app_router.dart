import 'package:barter_project_2023/features/log_in/presentation/views/login_view.dart';
import 'package:barter_project_2023/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const kSplashView = '/';
  static const pOnBoardingView = '/onBoardingView';
  static const kOnBoardingView = 'onBoardingView';
  static final rout = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        name: kOnBoardingView,
        path: pOnBoardingView,
        builder: (context, state) => const OnBoadingView(),
      ),
    ],
  );
}
