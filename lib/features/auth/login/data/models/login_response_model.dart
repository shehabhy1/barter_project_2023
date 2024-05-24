// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool status;
  final String token;
  @JsonKey(name: 'user')
  final UserData user;
  const LoginResponse({
    required this.status,
    required this.token,
    required this.user,
  });
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final Image? image;
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? role;
  final bool? active;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  const UserData({
    this.image,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.role,
    this.active,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@JsonSerializable()
class Image {
  final String? url;
  final String? imageId;
  const Image({
    this.url,
    this.imageId,
  });
  Map<String, dynamic> toJson() => _$ImageToJson(this);
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
