import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  static PostCubit get(context) => BlocProvider.of(context);
  List<PostModel> posts = [];

  final CollectionReference _postCollectionRef =
      FirebaseFirestore.instance.collection('Posts');
  Future<void> addPost({
    required String name,
    required String category,
    required String subCategory,
    required String disc,
  }) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    _postCollectionRef.doc().set(PostModel(
          // fName: ,
          userId: currentUser!.uid,
          name: name,
          category: category,
          subCategory: subCategory,
          disc: disc,
          pic: '',
        ).toJson());
  }

  void getPost() {
    _postCollectionRef.snapshots().listen((event) {
      for (var doc in event.docs) {
        posts.add(PostModel.fromJson(doc));
      }
      emit(GetPostSuccess(posts: posts));
    });
  }
}
