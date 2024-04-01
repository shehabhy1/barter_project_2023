import 'package:barter_app/bloc_observer.dart';
import 'package:barter_app/core/di/injection.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:barter_app/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();

  runApp(BarterApp(
    appRouter: AppRouter(),
  ));
}

class BarterApp extends StatelessWidget {
  const BarterApp({
    super.key,
    required this.appRouter,
  });
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generatRoute,
        initialRoute: Routes.routingSplashView,
        title: 'Barter App',
      ),
    );
  }
}
