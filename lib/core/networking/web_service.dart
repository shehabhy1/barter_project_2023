// import 'package:barter_app/core/networking/api_constants.dart';
// import 'package:barter_app/features/auth/forget_pass/data/models/forget_pass_model.dart';
// import 'package:barter_app/features/auth/login/data/models/login_request_model.dart';
// import 'package:barter_app/features/auth/login/data/models/login_response_model.dart';
// import 'package:barter_app/features/auth/register/data/models/register_response_model.dart';
// import 'package:barter_app/features/profile_screen/data/models/user_info_model.dart';
// import 'package:dio/dio.dart' hide Headers;
// import 'package:retrofit/retrofit.dart';

// part 'web_service.g.dart';

// @RestApi(baseUrl: ApiConstants.baseUrl)
// abstract class WebService {
//   factory WebService(Dio dio, {String baseUrl}) = _WebService;

//   @POST(ApiConstants.login)
//   Future<LoginResponse> login(@Body() LoginRequest loginRequest);
//   @POST(ApiConstants.register)
//   @MultiPart()
//   @Headers({'Content-Type': 'multipart/form-data'})
//   Future<RegisterResponse> register(
//     @Body() FormData body,
//   );
//   @POST(ApiConstants.forgetPassword)
//   Future<ForgetPassResponse> forgetPassword(@Field('email') String email);
//   @POST(ApiConstants.verifyResetCode)
//   @Headers({'Content-Type': 'application/json'})
//   Future<dynamic> verifyResetCode(@Field('resetCode') String resetCode);
//   @POST(ApiConstants.resetPassword)
//   Future<dynamic> resetPassword(
//     @Field('email') String email,
//     @Field('password') String password,
//   );
//   @GET(ApiConstants.getMyInfo)
//   Future<UserInfo> getMyInfo(
//     @Header('Authorization') String token,
//   );
// }
