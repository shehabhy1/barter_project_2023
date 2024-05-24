import 'package:barter_app/barter_app.dart';
import 'package:barter_app/bloc_observer.dart';
import 'package:barter_app/core/di/injection.dart';
import 'package:barter_app/core/helper/cash_helper/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:barter_app/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  await CachHelper.init();
  //token = await CacheHelper.getData(key: AppConstants.kUserToken);
  //debugPrint('Token is $token');

  runApp(BarterApp(appRouter: AppRouter()));
}
