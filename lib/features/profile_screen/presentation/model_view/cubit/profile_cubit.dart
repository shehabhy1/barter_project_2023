import 'package:barter_app/features/profile_screen/data/repo/profile_repo.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/helper/cash_helper/cache_helper.dart';
import '../../../../../core/helper/cash_helper/cash_helper_constants.dart';

class GetProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  GetProfileCubit(this._profileRepo) : super(ProfileInitial());

  final formKey = GlobalKey<FormState>();
  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController phoneController = TextEditingController();
  late final TextEditingController whatsController = TextEditingController();
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
      CachHelper.putData(
          key: CashConstants.userName, value: userInfo.data!.name);
      CachHelper.putData(
          key: CashConstants.userEmail, value: userInfo.data!.email);
      CachHelper.putData(
          key: CashConstants.userImage, value: userInfo.data!.image!.url);
      CachHelper.putData(
          key: CashConstants.userNumber, value: userInfo.data!.phone);
      CachHelper.putData(
          key: CashConstants.userWhatsApp, value: userInfo.data!.whatsapp);
      emit(GetUserinfoSuccessState(userInfo: userInfo));
    });
  }
}
