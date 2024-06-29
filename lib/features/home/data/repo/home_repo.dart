import 'package:barter_app/core/networking/api_constants.dart';
import 'package:barter_app/core/networking/dio_factory.dart';
import 'package:barter_app/core/networking/errors/exceptions.dart';
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  DioFactory _dioFactory;
  HomeRepo(this._dioFactory);
  Future<Either<String, HomeResponseModel>> getAllProducts() async {
    try {
      var response = await _dioFactory.get(ApiConstants.getAllProducts);
      final homeResponse = HomeResponseModel.fromJson(response);
      return Right(homeResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }
}
