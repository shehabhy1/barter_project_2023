// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'web_service.dart';

// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

// class _WebService implements WebService {
//   _WebService(
//     this._dio, {
//     this.baseUrl,
//   }) {
//     baseUrl ??= 'https://barter.cyclic.app/api/v1/';
//   }

//   final Dio _dio;

//   String? baseUrl;

//   @override
//   Future<LoginResponse> login(LoginRequest loginRequest) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(loginRequest.toJson());
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'auth/login',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = LoginResponse.fromJson(_result.data!);
//     return value;
//   }

//   @override
//   Future<RegisterResponse> register(FormData body) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{r'Content-Type': 'multipart/form-data'};
//     _headers.removeWhere((k, v) => v == null);
//     final _data = body;
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<RegisterResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//       contentType: 'multipart/form-data',
//     )
//             .compose(
//               _dio.options,
//               'auth/signup',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = RegisterResponse.fromJson(_result.data!);
//     return value;
//   }

//   @override
//   Future<ForgetPassResponse> forgetPassword(String email) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = {'email': email};
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<ForgetPassResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'auth/forgetPassword',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = ForgetPassResponse.fromJson(_result.data!);
//     return value;
//   }

//   @override
//   Future<dynamic> verifyResetCode(String resetCode) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
//     _headers.removeWhere((k, v) => v == null);
//     final _data = {'resetCode': resetCode};
//     final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//       contentType: 'application/json',
//     )
//         .compose(
//           _dio.options,
//           'auth/verifyResetCode',
//           queryParameters: queryParameters,
//           data: _data,
//         )
//         .copyWith(
//             baseUrl: _combineBaseUrls(
//           _dio.options.baseUrl,
//           baseUrl,
//         ))));
//     final value = _result.data;
//     return value;
//   }

//   @override
//   Future<dynamic> resetPassword(
//     String email,
//     String password,
//   ) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = {
//       'email': email,
//       'password': password,
//     };
//     final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//         .compose(
//           _dio.options,
//           'auth/resetPassword',
//           queryParameters: queryParameters,
//           data: _data,
//         )
//         .copyWith(
//             baseUrl: _combineBaseUrls(
//           _dio.options.baseUrl,
//           baseUrl,
//         ))));
//     final value = _result.data;
//     return value;
//   }

//   @override
//   Future<UserInfo> getMyInfo(String token) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{r'Authorization': token};
//     _headers.removeWhere((k, v) => v == null);
//     final Map<String, dynamic>? _data = null;
//     final _result =
//         await _dio.fetch<Map<String, dynamic>>(_setStreamType<UserInfo>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'user/getMe',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = UserInfo.fromJson(_result.data!);
//     return value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(
//     String dioBaseUrl,
//     String? baseUrl,
//   ) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }
