// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) =>
    HomeResponseModel(
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paginationResult: json['paginationResult'] == null
          ? null
          : PaginationResult.fromJson(
              json['paginationResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeResponseModelToJson(HomeResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'data': instance.data,
      'paginationResult': instance.paginationResult,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      image: json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      description: json['description'] as String?,
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['_id'] as String?,
      status: json['status'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'slug': instance.slug,
      'category': instance.category,
      'brand': instance.brand,
      'user': instance.user,
      'description': instance.description,
      'subcategory': instance.subcategory,
      '_id': instance.id,
      'status': instance.status,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      url: json['url'] as String?,
      imageId: json['imageId'] as String?,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'url': instance.url,
      'imageId': instance.imageId,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] == null
          ? null
          : UserImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'image': instance.image,
    };

UserImage _$UserImageFromJson(Map<String, dynamic> json) => UserImage(
      url: json['url'] as String?,
      imageId: json['imageId'] as String?,
    );

Map<String, dynamic> _$UserImageToJson(UserImage instance) => <String, dynamic>{
      'url': instance.url,
      'imageId': instance.imageId,
    };

PaginationResult _$PaginationResultFromJson(Map<String, dynamic> json) =>
    PaginationResult(
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationResultToJson(PaginationResult instance) =>
    <String, dynamic>{
      'numberOfPages': instance.numberOfPages,
      'currentPage': instance.currentPage,
      'limit': instance.limit,
    };
