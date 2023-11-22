class UserModel {
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String whatsapp;
  final String password;
  final String gender;
  final String? pic;

  UserModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.whatsapp,
    required this.password,
    required this.gender,
    required this.pic,
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      id: (jsonData['id']),
      fName: jsonData['fname'],
      lName: jsonData['lname'],
      email: (jsonData['email']),
      whatsapp: (jsonData['whatsapp']),
      password: (jsonData['password']),
      gender: (jsonData['gender']),
      pic: (jsonData['pic']),
    );
  }

  toJson() {
    return {
      'id': id,
      'fname': fName,
      'lname': lName,
      'email': email,
      'whatsapp': whatsapp,
      'password': password,
      'gender': gender,
      'pic': pic,
    };
  }
}
