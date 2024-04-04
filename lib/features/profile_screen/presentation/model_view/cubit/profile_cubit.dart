import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/features/profile_screen/data/repo/profile_repo.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_state.dart';
import 'package:barter_app/core/utils/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final ProfileRepo _profileRepo;

  Future<void> getMyInfo() async {
    // emit(const ProfileState.loading());
    String token = await CacheHelper.getData(key: AppConstants.kUserToken);
    debugPrint('user token ======$token');
    final result = await _profileRepo.getMyInfo();
    result.fold((error) {
      emit(GetUserinfoErrorState(error: error));
    }, (userInfo) {
      emit(GetUserinfoSuccessState(userInfo: userInfo));
    });
  }
}
