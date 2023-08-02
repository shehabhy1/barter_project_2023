import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  runApp(const BarterApp());
  await CacheHelper.init();
}

class BarterApp extends StatelessWidget {
  const BarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          MaterialApp.router(
        title: 'Barter App',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routeScreens,
      ),
    );
  }
}
