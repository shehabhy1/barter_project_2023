import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/networking/api_constants.dart';
import 'package:barter_app/core/networking/dio_factory.dart';
import 'package:barter_app/core/networking/errors/exceptions.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:barter_app/features/auth/login/data/models/login_request_model.dart';
import 'package:barter_app/features/auth/login/data/models/login_response_model.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  final DioFactory _dioFactory;
  LoginRepo(
    this._dioFactory,
  );

  Future<Either<String, LoginResponse>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dioFactory.post(ApiConstants.login,
          data: LoginRequest(email: email, password: password).toJson());
      final loginResponse = LoginResponse.fromJson(response);

      CacheHelper.saveString(
          key: AppConstants.kUserToken, value: loginResponse.token);
      return Right(loginResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }
}
