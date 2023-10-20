import 'dart:io';

import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

import '../../../data/model/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  static PostCubit get(context) => BlocProvider.of(context);

  List<PostModel> posts = [];

  final CollectionReference _postCollectionRef =
      FirebaseFirestore.instance.collection('Users');
  String currentUser = CacheHelper.getData(key: Constant.kEmail);
  Future<void> addPost({
    required String name,
    required String category,
    required String subCategory,
    required String disc,
    required String image,
  }) async {
    //get email from shared pref

    PostModel postModel = PostModel(
      // fName: ,
      userId: currentUser,
      name: name,
      category: category,
      subCategory: subCategory,
      disc: disc,
      pic: image,
    );
    _postCollectionRef
        .doc(currentUser)
        .collection('posts')
        .add(postModel.toJson())
        .then((value) => emit(AddPostSuccess()))
        .catchError((error) {
      emit(AddPostFailure());
    });
  }

  void getMyPosts() {
    posts.clear();
    emit(GetPostLoading());
    _postCollectionRef.doc(currentUser).collection('posts').get().then((value) {
      for (var element in value.docs) {
        posts.add(PostModel.fromJson(element));
      }
      debugPrint('/////////////////');
      debugPrint(posts[1].name);
      debugPrint('/////////////////');
      emit(GetPostSuccess(posts: posts));
    }).catchError((error) {
      emit(GetPostFailure(error: error.toString()));
    });
  }

  File? imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  Future<void> getPostImage() async {
    final xFile = await _imagePicker.getImage(source: ImageSource.gallery);
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

  Future<void> uploadFile({
    required String name,
    required String category,
    required String subCategory,
    required String disc,
  }) async {
    if (imageFile == null) return;
    final fileName = p.basename(imageFile!.path);
    final destination = '$currentUser/${Uri.file(fileName).pathSegments.last}';

    final ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('products/$destination');
    await ref.putFile(imageFile!).then((value) async {
      await value.ref.getDownloadURL().then((imageUrl) {
        addPost(
            name: name,
            category: category,
            subCategory: subCategory,
            disc: disc,
            image: imageUrl.toString());
      });
      imageFile = null;
      emit(UploadImageSuccessState());
    }).catchError((error) {
      emit(UploadImageErrorState(error: error));
    });
  }

}
