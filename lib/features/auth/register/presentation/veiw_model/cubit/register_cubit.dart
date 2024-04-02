import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:barter_app/features/auth/register/data/register_repo/register_repo.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/shared_widget/warning_dialog.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(RegisterInitial());

  final RegisterRepo _registerRepo;
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController whatsController = TextEditingController();
  late AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  //File? imageFile;
  XFile? profilePic;
  String? gender;
  // uploadProfilePic(XFile image) {
  //   profilePic = image;
  //   emit(UploadProfilePic());
  // }

  void emitRegisterStates() async {
    emit(RegisterLoadingState());

    var response = await _registerRepo.register(
      email: emailController.text,
      password: passwordController.text,
      gender: gender!,
      name: nameController.text,
      whatsapp: whatsController.text,
      phone: phoneController.text,
      image: profilePic!.path,
    );
    response.fold((error) {
      emit(RegisterErrorState(error: error));
    }, (registerResponse) {
      emit(RegisterSuccessState());
    });
  }

  void validateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(ValidateMode());
  }

  void validateThenDoLogin(context) {
    if (formKey.currentState!.validate()) {
      if (profilePic != null && gender != null) {
        emitRegisterStates();
      } else {
        AppErrors.showAwesomeDialog(
          title: 'Wrong',
          desc: profilePic?.path == null
              ? 'please select your image'
              : 'please select your gender',
          context: context,
          dialogType: DialogType.warning,
        );
      }
    } else {
      validateMode();
    }
  }
}
//mo925@gmail.com
//123456mmm