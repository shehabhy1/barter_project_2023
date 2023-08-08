import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:barter_project_2023/features/deals_view/presentation/view/deal_view.dart';
import 'package:barter_project_2023/features/home/presentation/view/product_details.dart';
import 'package:barter_project_2023/features/home/presentation/view/view_all_screen.dart';
import 'package:barter_project_2023/features/home/presentation/view/home_view.dart';
import 'package:barter_project_2023/features/layout/presentation/views/layout.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/login_view.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/signup_view.dart';
import 'package:barter_project_2023/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/notification/presentition/views/notification_screen.dart';
import '../../features/splash_view/presentation/views/splash_view.dart';

bool isLast = CacheHelper.getData(key: Constant.kOnBoardingView) ?? false;

class AppRouter {
  static const routingSplashView = '/';
  static const pOnBoardingView = '/onBoardingView';
  static const routingOnBoardingView = 'onBoardingView';
  static const routingloginView = 'loginView';
  static const ploginView = '/loginView';
  static const kLayoutView = 'layoutView';
  static const pLayoutView = '/layoutView';
  static const routingNotificationScreen = 'NotificationsScreen';
  static const pNotificationScreen = '/NotificationsScreen';
  static const kHomeView = '/homeScreen';
  static const pHomeView = '/homeScreen';
  static const kHomeAllView = '/homeAllScreen';
  static const pHomeAllView = '/homeAllScreen';
  static const kProductDetails = '/ProductDetails';
  static const pProductDetails = '/ProductDetails';


  static final routeScreens = GoRouter(
    routes: [
      GoRoute(
        path: routingSplashView,
//add splash view when finish
        builder: (context, state) => const DealView(),
      ),
      GoRoute(
          name: routingOnBoardingView,
          path: pOnBoardingView,
          builder: (context, state) =>
              isLast ? const LoginView() : const OnBoardingView()),
      GoRoute(
        name: routingloginView,
        path: ploginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        name: routingNotificationScreen,
        path: pNotificationScreen,
        builder: (context, state) => NotificationsScreen(),
      ),
      GoRoute(
        name: kHomeView,
        path: pHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        name: kHomeAllView,
        path: pHomeAllView,
        builder: (context, state) => const ViewAllScreen(),
      ),
      GoRoute(
        name: kProductDetails,
        path: pProductDetails,
        builder: (context, state) => const ProductDetails(),
      ),
      // GoRoute(
      //   name: kLayoutView,
      //   path: pLayoutView,
      //   builder: (context, state) => const LayoutView(),
      // ),
    ],
  );
}
