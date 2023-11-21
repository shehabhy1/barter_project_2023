import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/helper/cache_helper.dart';
import 'package:barter_project_2023/features/auth_screens/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  // bool isUserModelEmpty = false;
  String currentUser = CacheHelper.getData(key: Constant.kEmail);
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void getUserData() {
    //add loading states
    emit(GetProfileDataLoadingState());
    firebaseFirestore.collection('Users').doc(currentUser).get().then((value) {
      userModel = UserModel.fromJson(value.data());
      emit(GetProfileDataSuccessState());
      debugPrint('${userModel!.fName}F/////////');
    }).catchError((error) {
      //add error state
      emit(GetProfileDataErrorState(error: error.toString()));
    });
  }

  void updateUserData(
      {@required String? fName,
      @required String? lName,
      @required String? email,
      @required String? password}) {
    UserModel userModel = UserModel(
        id: this.userModel!.id,
        fName: fName ?? this.userModel!.fName,
        //TODO: get lName from editProfileScreen
        lName: lName ?? this.userModel!.lName,
        email: email ?? this.userModel!.email,
        password: password ?? this.userModel!.password,
        gender: this.userModel!.gender,
        pic: this.userModel!.pic);
    try {
      emit(UpdateProfileDataLoadingState());
      firebaseFirestore
          .collection('Users')
          .doc(currentUser)
          .update(userModel.toJson());
      emit(UpdateProfileDataSuccessState());
      getUserData();
    } catch (error) {
      emit(UpdateProfileDataErrorState(error: error.toString()));
    }
  }
}
