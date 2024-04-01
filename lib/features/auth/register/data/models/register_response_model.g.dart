// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'image': instance.image,
      'password': instance.password,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      url: json['url'] as String?,
      imageId: json['imageId'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
      'imageId': instance.imageId,
    };
