import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:barter_project_2023/core/utils/firestore_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model.dart';

part 'login_auth_state.dart';

// you have to separate the sign in function from the sign up
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  String gender = 'Male';

  UserModel? userModel;
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //save email in shared pref
      CacheHelper.saveString(
        key: Constant.kEmail,
        value: email,
      );

      debugPrint(
          '/////////////////${CacheHelper.getData(key: Constant.kEmail)}///////////////////');
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

  //ايكون الباسورد (محمد حسين)
  bool isPasswordShow = true;
  void PasswordShowed() {
    isPasswordShow = !isPasswordShow;
    emit(LoginShowPasswordState());
  }

  bool isNewPasswordShow = true;
  void NewPasswordShowed() {
    isNewPasswordShow = !isNewPasswordShow;
    emit(LoginShowNewPasswordState());
  }

  bool isRepeatPasswordShow = true;
  void RepeatPasswordShowed() {
    isRepeatPasswordShow = !isRepeatPasswordShow;
    emit(LoginShowRepeatPasswordState());
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
            UserModel(
              id: user.user!.uid,
              fName: fName,
              lName: lName,
              email: email,
              password: password,
              gender: gender,
              pic: '',
            ),
          );

          userModel = UserModel(
              id: user.user!.uid,
              fName: fName,
              lName: lName,
              email: email,
              password: password,
              gender: gender,
              pic: '');
          //save email in shared pref

          CacheHelper.saveString(
            key: Constant.kEmail,
            value: email,
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

  void getUserData() {
    emit(GetUserDataLoading());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(CacheHelper.getData(key: Constant.kEmail))
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value);
      emit(GetUserDataSuccess());
    }).catchError((error) {
      emit(GetUserDataError(error: error));
    });
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
