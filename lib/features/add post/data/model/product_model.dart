class ProductModel {
  final String userId;
  final String name;
  final String userName;
  final String category;
  final String subCategory;
  final String disc;
  final String? pic;

  ProductModel({
    required this.userName,
    required this.userId,
    required this.name,
    required this.category,
    required this.subCategory,
    required this.disc,
    required this.pic,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      userName: jsonData['userName'],
      userId: jsonData['id'],
      name: jsonData['name'],
      category: jsonData['category'],
      subCategory: jsonData['subCategory'],
      disc: jsonData['disc'],
      pic: jsonData['pic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'id': userId,
      'name': name,
      'category': category,
      'subCategory': subCategory,
      'disc': disc,
      'pic': pic,
    };
  }
}
