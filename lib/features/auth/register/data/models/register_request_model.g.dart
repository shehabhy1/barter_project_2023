// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      image: const Uint8ListConverter().fromJson(json['image'] as List<int>?),
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'image': const Uint8ListConverter().toJson(instance.image),
    };
