import 'package:barter_project_2023/features/log_in/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UsertModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.id.replaceAll(userModel.id, userModel.email))
        .set(userModel.toJson());
  }
}
