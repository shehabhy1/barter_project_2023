import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        CacheHelper.getData(key: AppConstants.kUserToken) != null
            ? 'Bearer ${CacheHelper.getData(key: AppConstants.kUserToken)}'
            : null;
    super.onRequest(options, handler);
  }
}
