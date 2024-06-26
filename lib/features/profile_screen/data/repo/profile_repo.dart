import 'package:barter_app/core/networking/api_constants.dart';
import 'package:barter_app/core/networking/dio_factory.dart';
import 'package:barter_app/core/networking/errors/exceptions.dart';
import 'package:barter_app/features/profile_screen/data/models/user_info_model.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo {
  final DioFactory _dioFactory;

  ProfileRepo(this._dioFactory);

  Future<Either<String, UserInfo>> getMyInfo() async {
    try {
      var response = await _dioFactory.get(ApiConstants.getMyInfo);
      final userInfo = UserInfo.fromJson(response);
      return Right(userInfo);
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }

  Future<Either<String, UserInfo>> updateUserInfo(
      String name, String phone, String whatsapp) async {
    try {
      final userInfo = await _dioFactory.put(ApiConstants.updateUserInfo,
          data: {'name': name, 'phone': phone, 'whatsapp': whatsapp});
      return Right(userInfo);
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }
}
