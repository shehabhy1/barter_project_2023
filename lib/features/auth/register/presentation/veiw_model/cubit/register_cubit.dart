import 'package:bloc/bloc.dart';
import 'package:barter_app/features/auth/register/data/register_repo/register_repo.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  XFile? imageFile;
  XFile? profilePic;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  final ImagePicker _imagePicker = ImagePicker();
  // Future<void> selectImage() async {
  //   final xFile = await _imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (xFile != null) {
  //     imageFile = File(
  //       xFile,
  //     );

  //     emit(ChosenImageSuccessfullyState());
  //   } else {
  //     emit(ChosenImageErrorState());
  //   }
  // }

  void removeImage() {
    imageFile = null;
    emit(RemoveImageSuccessState());
  }

  void emitRegisterStates() async {
    emit(RegisterLoadingState());

    var response = await _registerRepo.register(
      email: emailController.text,
      password: passwordController.text,
      gender: 'male',
      //TODO: handle user gender

      // gender: context.read<RegisterCubit>().selectedValue == 1
      //     ? 'male'
      //     : 'femal',
      //firstName: fNameController.text,
      name: nameController.text,
      whatsapp: whatsController.text,
      phone: phoneController.text,
      image: profilePic!,
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

  void validateThenDoLogin() {
    if (formKey.currentState!.validate()) {
      emitRegisterStates();
    } else {
      validateMode();
    }
  }
}
//mo925@gmail.com
//123456mmm