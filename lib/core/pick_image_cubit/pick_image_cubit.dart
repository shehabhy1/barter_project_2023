import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'pick_image_states.dart';

class PickImageCubit extends Cubit<PickImageStates> {
  PickImageCubit() : super(PickImageInitialState());
  XFile? selectImage;
  File? selectProfileImage;
  String imageBase64Sell = '';
  void pickImage(bool gellary) async {
    //  emit(PickImageLoadingState());
    try {
      final image = await ImagePicker().pickImage(
          source: gellary ? ImageSource.gallery : ImageSource.camera);
      selectImage = XFile(image!.path);
      emit(PickPostImageState());
    } catch (error) {
      emit(PickImageErrorState());
    }
  }

  void removeImage() {
    selectImage = null;
    selectProfileImage = null;
    emit(RemoveImageState());
  }
}
