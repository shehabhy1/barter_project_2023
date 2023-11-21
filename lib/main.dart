import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:barter_project_2023/core/helper/cache_helper.dart';
import 'package:barter_project_2023/features/layout/presentation/view_model/cubit/layout_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/add post/presentation/view_model/cubit/post_cubit.dart';
import 'features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'firebase_options.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  // to prevent rotation of the app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(
      const BarterApp(),
    );
  });

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
          BlocProvider(
            create: (context) => LayoutCubit(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => PostCubit()..getAllProducts(),
          ),
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
