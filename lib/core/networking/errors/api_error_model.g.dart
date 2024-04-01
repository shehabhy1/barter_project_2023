// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'errors': instance.errors,
      'message': instance.message,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      type: json['type'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'type': instance.type,
      'msg': instance.msg,
    };
