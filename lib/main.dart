import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:barter_project_2023/features/layout/presentation/view_model/cubit/layout_cubit.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/signup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'features/log_in/presentation/views/login_view.dart';
import 'features/log_in/presentation/views/widgets/login_body.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const BarterApp(),
  );

  await CacheHelper.init();
}

class BarterApp extends StatelessWidget {
  const BarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Barter App',
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
