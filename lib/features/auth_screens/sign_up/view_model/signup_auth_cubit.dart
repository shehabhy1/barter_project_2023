/* import 'package:barter_project_2023/features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/firestore_user.dart';
import '../../model/user_model.dart';

class SignupCubit extends Cubit<SignupAuthState> {
  
  static SignupCubit get(context) => BlocProvider.of(context);

  Future<void> registerUser({
    required String fName,
    required String lName,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (user) async {
          await FireStoreUser().addUserToFireStore(
            UsertModel(
              id: user.user!.uid,
              fName: fName,
              lName: lName,
              email: email,
              password: password,
              gender: gender,
              pic: '',
            ),
          );
        },
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailure(errMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure(errMessage: 'email-already-in-use'));
      }
    } catch (e) {
      emit(AuthFailure(errMessage: 'wrong'));
    }
  }
}
 */