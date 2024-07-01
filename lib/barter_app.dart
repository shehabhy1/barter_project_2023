import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'core/helper/app_constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class BarterApp extends StatelessWidget {
  const BarterApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generatRoute,
        //initialRoute: Routes.routingSplashView,
        initialRoute: Routes.routingSplashView,
        title: 'Barter App',
      ),
    );
  }
}
