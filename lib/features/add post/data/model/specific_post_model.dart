// ignore_for_file: public_member_api_docs, sort_constructors_first

class SpecificProductModel {
  final String itemName;
  final String category;
  final String subCategory;
  final String description;
  SpecificProductModel({
    required this.itemName,
    required this.category,
    required this.subCategory,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'itemName': itemName,
      'category': category,
      'subCategory': subCategory,
      'description': description,
    };
  }

  factory SpecificProductModel.fromJson(Map<String, dynamic> map) {
    return SpecificProductModel(
      itemName: map['itemName'] as String,
      category: map['category'] as String,
      subCategory: map['subCategory'] as String,
      description: map['description'] as String,
    );
  }

}
