import 'package:bloc/bloc.dart';

import 'package:barter_app/features/auth/register/data/register_repo/register_repo.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this._registerRepo,
  ) : super(RegisterInitial());

  final RegisterRepo _registerRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsController = TextEditingController();

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

  void emitRegisterStates({
    required String email,
    required String password,
    required String gender,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    emit(RegisterLoadingState());

    var response = await _registerRepo.register(
      email: email,
      password: password,
      gender: gender,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      image: profilePic!,
    );
    response.fold((error) {
      emit(RegisterErrorState(error: error));
    }, (registerResponse) {
      emit(RegisterSuccessState());
    });
  }
}
//mo925@gmail.com
//123456mmm