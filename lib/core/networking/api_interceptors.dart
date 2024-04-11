import 'package:barter_app/core/helper/cash_helper/cache_helper.dart';
import 'package:dio/dio.dart';
import '../helper/cash_helper/cash_helper_constants.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        CachHelper.getData(key: CashConstants.userToken) != null
            ? 'Bearer ${CachHelper.getData(key: CashConstants.userToken)}'
            : null;
    super.onRequest(options, handler);
  }
}
