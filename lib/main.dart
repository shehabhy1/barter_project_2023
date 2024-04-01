import 'package:barter_app/barter_app.dart';
import 'package:barter_app/bloc_observer.dart';
import 'package:barter_app/core/di/injection.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:barter_app/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    BarterApp(appRouter: AppRouter()),
  );
}
