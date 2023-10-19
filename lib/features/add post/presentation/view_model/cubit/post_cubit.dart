import 'dart:io';

import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/utils/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

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
  }) async {
    //get email from shared pref

    PostModel postModel = PostModel(
      // fName: ,
      userId: currentUser,
      name: name,
      category: category,
      subCategory: subCategory,
      disc: disc,
      pic: 'https://2u.pw/YtkV6Ry',
    );
    _postCollectionRef
        .doc(currentUser)
        .collection('posts')
        .add(postModel.toJson());
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

  File? postImageFile;
  final postImagePicker = ImagePicker();
  void getPostImage() async {
    final pickedPostImage =
        await postImagePicker.getImage(source: ImageSource.gallery);
    if (pickedPostImage != null) {
      postImageFile = File(pickedPostImage.path);
      emit(ChosenPostImageSuccessfullyState());
    } else {
      emit(ChosenPostImageErrorState());
    }
  }

  // void createPostWithoutImage(
  //     {required String postCaption, String? postImage}) {
  //   emit(UploadPostWithoutImageLoadingState()); // loading
  //   final model = PostDataModel(userData!.userName, userData!.userID,
  //       userData!.image, postCaption, timeNow.toString(), postImage ?? "");
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userData!.userID)
  //       .collection('posts')
  //       .add(model.toJson())
  //       .then((value) {
  //     getUsersPosts();
  //     emit(UploadPostWithoutImageSuccessState()); // success
  //   });
  // }

  // void createPostWithImage({required String postCaption}) {
  //   emit(UploadPostWithImageLoadingState()); // loading
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child("posts/${Uri.file(postImageFile!.path).pathSegments.last}")
  //       .putFile(postImageFile!)
  //       .then((value) {
  //     value.ref.getDownloadURL().then((imageUrl) {
  //       print("New post image added $imageUrl");
  //       // here upload post totally to FireStore with Image
  //       createPostWithoutImage(postCaption: postCaption, postImage: imageUrl);
  //     }).catchError((e) {
  //       print("Error during upload post Image => ${e.toString()}");
  //       emit(
  //           UploadImageForPostErrorState()); // error during upload postImage not totally Post
  //     });
  //   }).catchError((onError) {
  //     emit(UploadPostWithImageErrorState());
  //   });
  // }
}
