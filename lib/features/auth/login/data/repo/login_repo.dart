import 'package:barter_app/core/networking/api_constants.dart';
import 'package:barter_app/core/networking/dio_factory.dart';
import 'package:barter_app/core/networking/errors/exceptions.dart';
import 'package:barter_app/core/helper/cash_helper/cache_helper.dart';
import 'package:barter_app/features/auth/login/data/models/login_request_model.dart';
import 'package:barter_app/features/auth/login/data/models/login_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/helper/cash_helper/cash_helper_constants.dart';

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

      CachHelper.putData(
          key:  CashConstants.userToken, value: loginResponse.token);
      return Right(loginResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }
}
