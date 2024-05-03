import 'dart:typed_data';

import "package:json_annotation/json_annotation.dart";
part 'register_request_model.g.dart';


/// Converts to and from [Uint8List] and [List]<[int]>.
class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
  /// Create a new instance of [Uint8ListConverter].
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List<int>? json) {
    if (json == null) return null;

    return Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    if (object == null) return null;

    return object.toList();
  }
}

@JsonSerializable()
class RegisterRequest {
  String? email;
  String? password;
  String? gender;
  String? firstName;
  String? lastName;
  String? phone;
  @Uint8ListConverter()
  Uint8List? image;

  RegisterRequest(
      {required this.email,
      required this.password,
      required this.gender,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.image});
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
