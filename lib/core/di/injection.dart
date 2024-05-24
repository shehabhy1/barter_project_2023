import 'package:barter_app/core/networking/dio_factory.dart';
import 'package:barter_app/features/auth/forget_pass/data/repo/foreget_pass_repo.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/login/data/repo/login_repo.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/register/data/register_repo/register_repo.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/layout/presentation/view_model/cubit/layout_cubit.dart';
import 'package:barter_app/features/profile_screen/data/repo/profile_repo.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  getIt.registerLazySingleton<DioFactory>(() => DioFactory(dio: Dio()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

//forget password
  getIt.registerLazySingleton<ForgetPassRepo>(() => ForgetPassRepo(getIt()));
  getIt.registerFactory<ForgetPassCubit>(() => ForgetPassCubit(getIt()));

//profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<GetProfileCubit>(() => GetProfileCubit(getIt()));

  //layout
  getIt.registerFactory<LayoutCubit>(() => LayoutCubit());
}
