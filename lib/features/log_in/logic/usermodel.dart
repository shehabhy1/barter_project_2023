class UserModel {
  String id;
  String fName;
  String lName;
  String email;
  String password;
  String pic;
  String gender;

  UserModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
    required this.pic,
    required this.gender,
  });

  // Create an instance of Product from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fName: json['firstname'],
      lName: json['lastname'],
      email: json['email'],
      password: json['password'],
      pic: json['pic'],
      gender: json['gender'],
    );
  }

  // Convert a Product instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': fName,
      'lastname': lName,
      'email': email,
      'password': password,
      'pic': pic,
      'gender': gender,
    };
  }
}
