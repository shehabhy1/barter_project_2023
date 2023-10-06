import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:barter_project_2023/features/chat/presentation/view/chat_page.dart';
import 'package:barter_project_2023/features/deals_view/presentation/view/deal_view.dart';
import 'package:barter_project_2023/features/edit_profile/edit_profile_view.dart';
import 'package:barter_project_2023/features/home/presentation/view/product_details.dart';
import 'package:barter_project_2023/features/home/presentation/view/view_all_screen.dart';
import 'package:barter_project_2023/features/home/presentation/view/home_view.dart';
import 'package:barter_project_2023/features/layout/presentation/views/layout.dart';
import 'package:barter_project_2023/features/log_in/presentation/view_model/cubit/auth_cubit.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/login_view.dart';
import 'package:barter_project_2023/features/profile_screen/views/screens/report_details_screen.dart';
import 'package:barter_project_2023/features/profile_screen/views/screens/report_view.dart';
import 'package:barter_project_2023/features/settings/presentation/views/have_and_need_view.dart';
import 'package:barter_project_2023/features/settings/presentation/views/language_view.dart';
import 'package:barter_project_2023/features/splash_view/presentation/views/on_boarding_view.dart';
import 'package:barter_project_2023/features/splash_view/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/notification/presentition/views/notification_screen.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/swapping/sign_up_view.dart';

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
  // static const kHomeView = '/homeScreen';
  // static const pHomeView = '/homeScreen';
  static const kHomeAllView = '/homeAllScreen';
  static const pHomeAllView = '/homeAllScreen';
  static const kProductDetails = '/ProductDetails';
  static const pProductDetails = '/ProductDetails';
  static const editProfile = '/editProfile';
  static const settingsView = '/settingsView';
  static const chatpage = '/ChatPage';
  static const signup = '/signup';
  static const kReportView = '/ReportView';
  static const kReportDetailsView = '/ReportDetailsView';
  static const kDealView = '/DealView';
  static const kLanguageView = '/LanguageView';
  static const kHaveAndNeedView = '/HaveAndNeedView';

  static final routeScreens = GoRouter(
    routes: [
      GoRoute(
        path: routingSplashView,
        //add splash view when finish
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginView(),
        ),
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
        builder: (context, state) => const NotificationsScreen(),
      ),
      // GoRoute(
      //   name: kHomeView,
      //   path: pHomeView,
      //   builder: (context, state) => const HomeView(),
      // ),
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
      GoRoute(
        name: editProfile,
        path: editProfile,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        name: settingsView,
        path: settingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        name: chatpage,
        path: chatpage,
        builder: (context, state) => const ChatPage(),
      ),
      GoRoute(
        name: signup,
        path: signup,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        name: kReportView,
        path: kReportView,
        builder: (context, state) => const ReportView(),
      ),
      GoRoute(
        name: kDealView,
        path: kDealView,
        builder: (context, state) => const DealView(),
      ),
      GoRoute(
        name: kLanguageView,
        path: kLanguageView,
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        name: kReportDetailsView,
        path: kReportDetailsView,
        builder: (context, state) => const ReportDetailsScreen(),
      ),
      GoRoute(
        name: kHaveAndNeedView,
        path: kHaveAndNeedView,
        builder: (context, state) => const HaveAndNeedView(),
      ),
      // GoRoute(
      //   name: kLayoutView,
      //   path: pLayoutView,
      //   builder: (context, state) => const LayoutView(),
      // ),
    ],
  );
}
