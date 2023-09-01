import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:barter_project_2023/features/layout/presentation/view_model/cubit/layout_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/chat/presentation/view_model/cubits/chatCubit/chat_cubit.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LayoutCubit()),
          BlocProvider(create: (context) => ChatCubit()),
        ],
        child: MaterialApp.router(
          title: 'Barter App',
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.routeScreens,
        ),
      ),
    );
  }
}
