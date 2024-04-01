import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = CacheHelper.getData(key: AppConstants.kUserToken);
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
