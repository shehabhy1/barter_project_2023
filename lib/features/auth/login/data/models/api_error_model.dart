import 'package:json_annotation/json_annotation.dart';
part '../../../forget_pass/data/models/api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? status;
  final int? code;
  final List<Error>? errors;
  final String? message;
  const ApiErrorModel({this.status, this.message, this.code, this.errors});

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}

@JsonSerializable()
class Error {
  final String? type;
  final String? msg;
  const Error({this.type, this.msg});
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
