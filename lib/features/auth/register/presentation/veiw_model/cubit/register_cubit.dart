import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:barter_app/features/auth/register/data/register_repo/register_repo.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/shared_widget/warning_dialog.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(RegisterInitial());

  final formKey = GlobalKey<FormState>();
  late AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController phoneController = TextEditingController();
  late final TextEditingController whatsController = TextEditingController();

  String? gender;
  bool isChecked = false;

  void emitRegisterStates(XFile profilePic) async {
    emit(RegisterLoadingState());

    var response = await _registerRepo.register(
      email: emailController.text,
      password: passwordController.text,
      gender: gender!,
      name: nameController.text,
      whatsapp: whatsController.text,
      phone: phoneController.text,
      image: profilePic.path,
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

  void validateThenDoLogin(context, {XFile? profilePic}) {
    if (formKey.currentState!.validate()) {
      if (profilePic != null && gender != null && isChecked == true) {
        emitRegisterStates(profilePic);
      } else {
        AppWarning.showAwesomeDialog(
          title: 'Wrong',
          desc: profilePic == null
              ? 'please select your image'
              : gender == null
                  ? 'please select your gender'
                  : 'Privacy & Policy',
          context: context,
          dialogType: DialogType.warning,
        );
      }
    } else {
      validateMode();
    }
  }
}
