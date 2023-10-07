import 'package:barter_project_2023/core/utils/firestore_user.dart';
import 'package:barter_project_2023/features/log_in/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  String gender = 'Male';

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure(errMessage: 'user-not-found'));
        debugPrint('user-not-found');
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure(errMessage: 'wrong-password'));
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        emit(AuthFailure(errMessage: 'user not found or wrong password'));
        debugPrint(e.toString());
      }
    }
    // catch (e) {
    //   emit(AuthFailure(errMessage: 'wrong'));
    // }
  }

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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
