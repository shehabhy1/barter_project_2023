import 'package:barter_app/core/networking/api_constants.dart';
import 'package:barter_app/core/networking/dio_factory.dart';
import 'package:barter_app/core/networking/errors/exceptions.dart';
import 'package:barter_app/features/auth/register/data/models/register_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';

class RegisterRepo {
  final DioFactory _dioFactory;

  RegisterRepo(this._dioFactory);

  Future<Either<String, RegisterResponse>> register({
    required String email,
    required String password,
    required String gender,
    required String name,
    required String whatsapp,
    required String phone,
    required XFile image,
  }) async {
    String? mimeType = mime(image.path);
    String mimee = mimeType!.split('/')[0];
    String type = mimeType.split('/')[1];
    try {
      var response = await _dioFactory.post(ApiConstants.register,
          data: {
            'email': email,
            'password': password,
            'gender': gender,
            'name': name,
            'whatsapp': whatsapp,
            'phone': phone,
            'image': await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
              contentType: MediaType(mimee, type),
            ),
          },
          isFormData: true);

      final registerResponse = RegisterResponse.fromJson(response);
      return Right(registerResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errors![0].msg ?? e.errModel.message!);
    }
  }
}
