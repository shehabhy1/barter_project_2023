import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/features/profile_screen/data/repo/profile_repo.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/cache_helper.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController whatsController = TextEditingController();
  XFile? profilePic;

  Future<void> getMyInfo() async {
    // emit(const ProfileState.loading());
    //String token = await CacheHelper.getData(key: AppConstants.kUserToken);
    //debugPrint('user token ======$token');
    emit(GetUserinfoLoadingState());
    final result = await _profileRepo.getMyInfo();
    result.fold((error) {
      emit(GetUserinfoErrorState(error: error));
    }, (userInfo) async {
      await CacheHelper.putData(
          key: AppConstants.kUserName, value: userInfo.data!.name);
      await CacheHelper.putData(
          key: AppConstants.kUserEmail, value: userInfo.data!.email);
      await CacheHelper.putData(
          key: AppConstants.kUserImage, value: userInfo.data!.image!.url);
      await CacheHelper.putData(
          key: AppConstants.kUserNumber, value: userInfo.data!.phone);
      await CacheHelper.putData(
          key: AppConstants.kUserWhatsAppNumber,
          value: userInfo.data!.whatsapp);
      emit(GetUserinfoSuccessState(userInfo: userInfo));
    });
  }
}
