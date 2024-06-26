import 'package:barter_app/features/edit_profile/data/repo/update_user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/cash_helper/cache_helper.dart';
import '../../../../core/helper/cash_helper/cash_helper_constants.dart';
import 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserStatus> {
  final UpdateUserRepo _repo;
  UpdateUserCubit(this._repo) : super(EditUserInitial());

  // final formKey = GlobalKey<FormState>();
  late final TextEditingController nameController = TextEditingController(
      text: "${CashHelper.getData(key: CashConstants.userName)}");

  late final TextEditingController whatsAppController = TextEditingController(
      text: "${CashHelper.getData(key: CashConstants.userWhatsApp)}");
  late final TextEditingController phoneController = TextEditingController(
      text: "${CashHelper.getData(key: CashConstants.userPhone)}");

  Future<void> updateUserInfo() async {
    emit(EditUserLoadingState());
    final result = await _repo.updateUserInfo(
      name: nameController.text,
      whatsapp: whatsAppController.text,
      phone: phoneController.text,
    );
    result.fold((error) {
      emit(EditUserErrorState(error: error));
    }, (message) {
      // userData = userInfo.data!;
      emit(EditUserSuccessState(message: message));
    });
  }

  // void validateThenDoEdit({File? image}) {
  //   if (formKey.currentState!.validate()) {
  //     emitToEditMyInfo(image);
  //   }
  // }
}
