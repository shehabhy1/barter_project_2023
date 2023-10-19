class PostModel {
  final String userId;
  final String name;
  // final String fName;
  // final String lName;
  final String category;
  final String subCategory;
  final String disc;
  final String? pic;

  PostModel({
    // required this.fName,
    // required this.lName,
    required this.userId,
    required this.name,
    required this.category,
    required this.subCategory,
    required this.disc,
    required this.pic,
  });

  factory PostModel.fromJson(jsonData) {
    return PostModel(
      // fName: jsonData['fName'],
      // lName: jsonData['lName'],
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
      // 'fName': fName,
      // 'lName': lName,
      'id': userId,
      'name': name,
      'category': category,
      'subCategory': subCategory,
      'disc': disc,
      'pic': pic,
    };
  }
}
