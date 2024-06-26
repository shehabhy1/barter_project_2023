import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfo {
  final UserData? data;
  const UserInfo({this.data});
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@JsonSerializable()
class UserData {
  final Image? image;
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? gender;
  final String? phone;
  final String? whatsapp;
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
  Image({this.url, this.imageId});
  Map<String, dynamic> toJson() => _$ImageToJson(this);
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
