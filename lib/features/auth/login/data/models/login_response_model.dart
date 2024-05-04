// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  bool status;
  String token;
  @JsonKey(name: 'user')
  UserData user;
  LoginResponse({
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
  Image? image;
  @JsonKey(name: '_id')
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? role;
  bool? active;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  UserData({
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
  String? url;
  String? imageId;
  Image({
    this.url,
    this.imageId,
  });
  Map<String, dynamic> toJson() => _$ImageToJson(this);
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
