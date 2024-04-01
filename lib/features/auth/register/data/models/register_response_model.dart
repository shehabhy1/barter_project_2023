import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponse {
  String? token;
  UserData? user;
  RegisterResponse({
    this.token,
    this.user,
  });
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? image;
  String? password;
  UserData({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.image,
    this.password,
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
