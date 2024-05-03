import 'package:json_annotation/json_annotation.dart';

part 'forget_pass_model.g.dart';
@JsonSerializable()

class ForgetPassResponse {
  String? status;
  String? message;
  ForgetPassResponse({
    this.status,
    this.message,
  });
  factory ForgetPassResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPassResponseFromJson(json);
}
