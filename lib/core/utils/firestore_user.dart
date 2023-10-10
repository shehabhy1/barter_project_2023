import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/auth_screens/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UsertModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.id.replaceAll(userModel.id, userModel.email))
        .set(userModel.toJson());
  }
}
