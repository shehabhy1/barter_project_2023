import 'package:json_annotation/json_annotation.dart';
part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String? token;
  final UserData? user;
  const RegisterResponse({this.token, this.user});
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String? name;
  final String? email;
  final String? gender;
  final String? phone;
  final Image? image;
  final String? password;
  final String? whatsapp;
  const UserData({
    this.name,
    this.email,
    this.gender,
    this.phone,
    this.image,
    this.password,
    this.whatsapp,
  });

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@JsonSerializable()
class Image {
  final String? url;
  final String? imageId;
  const Image({this.url, this.imageId});

  Map<String, dynamic> toJson() => _$ImageToJson(this);
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
