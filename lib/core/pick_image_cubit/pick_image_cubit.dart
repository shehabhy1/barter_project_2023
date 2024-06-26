import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'pick_image_states.dart';

class PickImageCubit extends Cubit<PickImageStates> {
  PickImageCubit() : super(PickImageInitialState());
  XFile? selectImage;
  File? selectProfileImage;
  String imageBase64Sell = '';
  void pickFromGallary(bool post) async {
    emit(PickImageLoadingState());
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        if (post) {
          selectImage = XFile(image.path);
          emit(PickPostImageState());
        } else {
          selectProfileImage = File(image.path);
          List<int> imageBytes = selectProfileImage!.readAsBytesSync();
          imageBase64Sell = base64Encode(imageBytes);
          log("############$imageBase64Sell");
          emit(PickProfileImageState());
        }
      }
    } catch (error) {
      emit(PickImageErrorState());
    }
  }

  Future<void> pickFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      selectImage = XFile(image.path);
      emit(PickPostImageState());
    } else {
      emit(PickImageErrorState());
    }
  }

  void removeImage() {
    selectImage = null;
    selectProfileImage = null;
    emit(RemoveImageState());
  }
}
