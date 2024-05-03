import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';
@JsonSerializable()
class ApiErrorModel {
  String? status;
  int? code;
  List<Error>? errors;
  String? message;
  ApiErrorModel({this.status, this.message, this.code, this.errors});
  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}

@JsonSerializable()
class Error {
  String? type;
  String? msg;
  Error({
    this.type,
    this.msg,
  });
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
