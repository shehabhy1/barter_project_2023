// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel {
  int? results;
  List<ProductModel>? data;
  HomeResponseModel({this.results, this.data});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);
}

@JsonSerializable()
class ProductModel {
  ImageData? image;
  String? title;
  String? slug;
  Category? category;
  Brand? brand;
  User? user;
  String? description;
  List<String>? subcategory;
  @JsonKey(name: '_id')
  String? id;
  String? status;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  ProductModel({
    this.image,
    this.title,
    this.slug,
    this.category,
    this.brand,
    this.user,
    this.description,
    this.subcategory,
    this.id,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@JsonSerializable()
class ImageData {
  String? url;
  String? imageId;

  ImageData({
    this.url,
    this.imageId,
  });
  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  Category({
    this.id,
    this.name,
  });
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  Brand({
    this.id,
    this.name,
  });
  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? phone;
  UserImage? image;

  User({this.id, this.name, this.phone, this.image});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class UserImage {
  String? url;
  String? imageId;
  UserImage({
    this.url,
    this.imageId,
  });

  factory UserImage.fromJson(Map<String, dynamic> json) =>
      _$UserImageFromJson(json);
}
