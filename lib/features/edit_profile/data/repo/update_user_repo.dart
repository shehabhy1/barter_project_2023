import 'package:barter_app/core/networking/api_constants.dart';
import 'package:barter_app/core/networking/dio_factory.dart';
import 'package:barter_app/core/networking/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

class UpdateUserRepo {
  final DioFactory _dioFactory;
  const UpdateUserRepo(this._dioFactory);

  Future<Either<String, String>> updateUserInfo({
    required String name,
    required String phone,
    required String whatsapp,
  }) async {
    try {
      await _dioFactory.put(ApiConstants.updateUserInfo,
          data: {'name': name, 'phone': phone, 'whatsapp': whatsapp});
      return const Right('Updated Successfully');
    } on ServerException catch (e) {
      return Left(e.errModel.message!);
    }
  }
}
