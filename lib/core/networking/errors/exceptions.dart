import 'package:barter_app/core/networking/errors/api_error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ApiErrorModel errModel;

  ServerException({required this.errModel});

  static void handleDioExceptions(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(
            errModel: ApiErrorModel.fromJson(e.response!.data));
      case DioExceptionType.sendTimeout:
        throw ServerException(
            errModel: ApiErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
        throw ServerException(
            errModel: ApiErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
        throw ServerException(
            errModel: ApiErrorModel.fromJson(e.response!.data));
      case DioExceptionType.cancel:
        throw ServerException(
            errModel: ApiErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionError:
        throw ServerException(
            errModel: ApiErrorModel(
                message: 'Please Check your Internet',
                errors: [Error(msg: 'Please Check your Internet')]));
      case DioExceptionType.unknown:
        if (e.response != null &&
            e.response?.statusCode != null &&
            e.response?.statusMessage != null) {
          ApiErrorModel.fromJson(e.response!.data);
        }
        throw ServerException(
            errModel: ApiErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: // Bad request
            throw ServerException(
                errModel: ApiErrorModel.fromJson(e.response!.data));
          case 401: //unauthorized
            throw ServerException(
                errModel: ApiErrorModel.fromJson(e.response!.data));
          case 403: //forbidden
            throw ServerException(
                errModel: ApiErrorModel.fromJson(e.response!.data));
          case 404: //not found
            throw ServerException(
                errModel: ApiErrorModel.fromJson(e.response!.data));
          case 409: //cofficient
            throw ServerException(
                errModel: ApiErrorModel.fromJson(e.response!.data));
          case 422: //  Unprocessable Entity
            throw ServerException(
                errModel: ApiErrorModel.fromJson(e.response!.data));
          case 504: // Server exception
            throw ServerException(
                errModel: ApiErrorModel.fromJson(e.response!.data));
        }
    }
  }
}

//  switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//       return DataSource.CONNECT_TIMEOUT.getFailure();
//     case DioExceptionType.sendTimeout:
//       return DataSource.SEND_TIMEOUT.getFailure();
//     case DioExceptionType.receiveTimeout:
//       return DataSource.RECIEVE_TIMEOUT.getFailure();
//     case DioExceptionType.badResponse:
//       if (error.response != null &&
//           error.response?.statusCode != null &&
//           error.response?.statusMessage != null) {
//         return ApiErrorModel.fromJson(error.response!.data);
//       } else {
//         return DataSource.DEFAULT.getFailure();
//       }
//     case DioExceptionType.unknown:
//       if (error.response != null &&
//           error.response?.statusCode != null &&
//           error.response?.statusMessage != null) {
//         return ApiErrorModel.fromJson(error.response!.data);
//       } else {
//         return DataSource.DEFAULT.getFailure();
//       }
//     case DioExceptionType.cancel:
//       return DataSource.CANCEL.getFailure();
//     case DioExceptionType.connectionError:
//       return DataSource.NO_INTERNET_CONNECTION.getFailure();
//     case DioExceptionType.badCertificate:
//       return DataSource.DEFAULT.getFailure();

//   }