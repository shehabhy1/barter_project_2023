import 'package:barter_app/core/networking/api_constants.dart';
import 'package:barter_app/core/networking/api_consumer.dart';
import 'package:barter_app/core/networking/api_interceptors.dart';
import 'package:barter_app/core/networking/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory extends APiConsumer {
  final Dio dio;

  Duration timeOut = const Duration(seconds: 65);
  DioFactory({required this.dio}) {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      ServerException.handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      ServerException.handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      ServerException.handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      ServerException.handleDioExceptions(e);
    }
  }

  @override
  Future put(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final response = await dio.put(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      ServerException.handleDioExceptions(e);
    }
  }
}
