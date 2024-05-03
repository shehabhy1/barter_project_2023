// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfo {
  UserData? data;
  UserInfo({
    this.data,
  });
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@JsonSerializable()
class UserData {
  Image? image;
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? gender;
  String? phone;
  String? whatsapp;
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
    this.name,
    this.email,
    this.gender,
    this.phone,
    this.whatsapp,
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
