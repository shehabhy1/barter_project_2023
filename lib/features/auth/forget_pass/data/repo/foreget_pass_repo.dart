import 'package:barter_app/core/networking/api_constants.dart';
import 'package:barter_app/core/networking/dio_factory.dart';
import 'package:barter_app/core/networking/errors/exceptions.dart';
import 'package:barter_app/features/auth/forget_pass/data/models/forget_pass_model.dart';
import 'package:dartz/dartz.dart';

class ForgetPassRepo {
  final DioFactory _dioFactory;

  ForgetPassRepo(this._dioFactory);

  Future<Either<String, ForgetPassResponse>> forgetPassword(
      String email) async {
    try {
      var response = await _dioFactory
          .post(ApiConstants.forgetPassword, data: {'email': email});
      final forgetPassResponse = ForgetPassResponse.fromJson(response);
      return Right(forgetPassResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }

  Future<Either<String, dynamic>> verifyResetCode(String resetCode) async {
    try {
      final response = await _dioFactory
          .post(ApiConstants.verifyResetCode, data: {'resetCode': resetCode});
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }

  Future<Either<String, dynamic>> resetPassword(
      String email, String pass) async {
    try {
      final response = await _dioFactory.post(ApiConstants.resetPassword,
          data: {'email': email, 'password': pass});
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }
}
