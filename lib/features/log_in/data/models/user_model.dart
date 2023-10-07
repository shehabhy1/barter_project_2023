class UsertModel {
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String password;
  final String gender;
  final String? pic;

  UsertModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
    required this.gender,
    required this.pic,
  });

  factory UsertModel.fromJson(jsonData) {
    return UsertModel(
      id: (jsonData['id']),
      fName: jsonData['fname'],
      lName: jsonData['lname'],
      email: (jsonData['email']),
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
      'password': password,
      'gender': gender,
      'pic': pic,
    };
  }
}
