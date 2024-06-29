import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostCubitInitial());
  static PostCubit get(context) => BlocProvider.of(context);
  final List<String> categoryOptions = [
    'Electronics',
    'Fashion&Cosmetics',
    'Pets',
    'Books',
    'Home',
    'Vehicle',
    'Apartment',
    'Service',
  ];

  final Map<String, List<String>> subcategoryOptions = {
    'Electronics': [
      'Phones& Tablets',
      'Accessories',
      'Mobile numbers',
      'Gaming HDDs',
      'Photography equipment',
    ],
    'Fashion&Cosmetics': [
      'Clothes',
      'blogs & Shoes',
      'Cosmetics & Perfumes',
    ],
    'Pets': [
      'Cats',
      'Dogs',
      'Birds ',
      'Pet supplies or accessories',
    ],
    'Books': [
      'Novels & stories',
      'Books',
      ' Newspappers & magazines',
      'School books',
      'Faculty books',
    ],
    'Home': [
      'Furniture',
      'Electrical devices',
      'Fabrics-curtains-carpets',
      'Decorations & accessories',
    ],
    'Vehicle': [
      'Vehicles',
      'Motorcycles',
      'Spare parts',
    ],
    'Apartment': [
      'Villas',
      'Lands',
    ],
    'Service': [
      'Cooking',
      'Teaching',
      'Driving',
      'Maintenance',
      'House keeping',
      'Photography',
    ],
  };

  File? imageFile;

  final ImagePicker _imagePicker = ImagePicker();
  Future<void> getPostImage() async {
    final xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      imageFile = File(xFile.path);
      emit(ChosenImageSuccessfullyState());
    } else {
      emit(ChosenImageErrorState());
    }
  }

  void removeImage() {
    imageFile = null;
    emit(RemoveImageSuccessfullyState());
  }

//specific Product image
  File? specFile;

  Future<void> getSpecifictProductImage() async {
    final xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      specFile = File(xFile.path);
      emit(ChosenImageSuccessfullyState());
    } else {
      emit(ChosenImageErrorState());
    }
  }

  void removeSpecImage() {
    imageFile = null;
    emit(RemoveImageSuccessfullyState());
  }
}
