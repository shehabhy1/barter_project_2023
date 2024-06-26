import 'package:barter_app/features/profile_screen/data/models/user_info_model.dart';
import 'package:barter_app/features/profile_screen/data/repo/get_user_repo.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/get_user_state.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/helper/cash_helper/cache_helper.dart';
import '../../../../../core/helper/cash_helper/cash_helper_constants.dart';

class GetUserCubit extends Cubit<GetProfileState> {
  final GetUserRepo _profileRepo;
  GetUserCubit(this._profileRepo) : super(ProfileInitial());

  XFile? profilePic;
  UserData? userData;
  Future<void> getMyInfo() async {
    // emit(const ProfileState.loading());
    //String token = await CacheHelper.getData(key: AppConstants.kUserToken);
    //debugPrint('user token ======$token');
    emit(GetUserinfoLoadingState());
    final result = await _profileRepo.getUser();
    result.fold((error) {
      emit(GetUserinfoErrorState(error: error));
    }, (userInfo) async {
      CashHelper.putData(
          key: CashConstants.userName, value: userInfo.data!.name);
      CashHelper.putData(
          key: CashConstants.userImage, value: userInfo.data!.image!.url);
      CashHelper.putData(
          key: CashConstants.userPhone, value: userInfo.data!.phone);
      CashHelper.putData(
          key: CashConstants.userWhatsApp, value: userInfo.data!.whatsapp);
      // userData = userInfo.data!;
      emit(GetUserinfoSuccessState(userInfo: userInfo));
    });
  }
}
