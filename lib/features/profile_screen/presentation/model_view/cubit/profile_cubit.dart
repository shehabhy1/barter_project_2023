import 'package:barter_app/features/profile_screen/data/models/user_info_model.dart';
import 'package:barter_app/features/profile_screen/data/repo/profile_repo.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final ProfileRepo _profileRepo;
  GetProfileCubit(this._profileRepo) : super(ProfileInitial());

  XFile? profilePic;
  UserData? userData;
  Future<void> getMyInfo() async {
    // emit(const ProfileState.loading());
    //String token = await CacheHelper.getData(key: AppConstants.kUserToken);
    //debugPrint('user token ======$token');
    emit(GetUserinfoLoadingState());
    final result = await _profileRepo.getMyInfo();
    result.fold((error) {
      emit(GetUserinfoErrorState(error: error));
    }, (userInfo) async {
      // CachHelper.putData(
      //     key: CashConstants.userName, value: userInfo.data!.name);
      // CachHelper.putData(
      //     key: CashConstants.userEmail, value: userInfo.data!.email);
      // CachHelper.putData(
      //     key: CashConstants.userImage, value: userInfo.data!.image!.url);
      // CachHelper.putData(
      //     key: CashConstants.userNumber, value: userInfo.data!.phone);
      // CachHelper.putData(
      //     key: CashConstants.userWhatsApp, value: userInfo.data!.whatsapp);
      userData = userInfo.data!;
      emit(GetUserinfoSuccessState(userInfo: userInfo));
    });
  }

  Future<void> updateUserInfo(
      {String? name, String? phone, String? whatsapp}) async {
    emit(UpdateUserinfoLoadingState());
    final result = await _profileRepo.updateUserInfo(name!, phone!, whatsapp!);
    result.fold((error) {
      emit(UpdateUserinfoErrorState(error: error));
    }, (userInfo) {
      userData = userInfo.data!;
      emit(UpdateUserinfoSuccessState(userInfo: userInfo));
    });
  }
}
