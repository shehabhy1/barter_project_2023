import 'dart:io';

import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/helper/cache_helper.dart';
import 'package:barter_project_2023/features/add%20post/data/model/product_model.dart';
import 'package:barter_project_2023/features/add%20post/data/model/specific_post_model.dart';
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
  List<PostModel> myHaveList = [];
  var exchangeSelected = '';
  final CollectionReference _postCollectionRef =
      FirebaseFirestore.instance.collection('Users');
  //get email from shared pref
  String currentUser = CacheHelper.getData(key: Constant.kEmail);
  Future<void> addPost({
    required String userName,
    required String name,
    required String category,
    required String subCategory,
    required String disc,
    required String image,
  }) async {
    PostModel postModel = PostModel(
      userId: currentUser,
      name: name,
      category: category,
      subCategory: subCategory,
      disc: disc,
      pic: image,
    );
    ProductModel productModel = ProductModel(
        userName: userName,
        userId: currentUser,
        name: name,
        category: category,
        subCategory: subCategory,
        disc: disc,
        pic: image);

    try {
      FirebaseFirestore.instance
          .collection('All Products')
          .doc()
          .set(productModel.toJson())
          .then((value) {
        _postCollectionRef
            .doc(currentUser)
            .collection('posts')
            .add(postModel.toJson());
        emit(AddPostSuccess());
      });
    } on Exception catch (error) {
      emit(AddPostFailure(error: error.toString()));
    }
  }

//Add Specific post to firebase
  Future<void> addSpecPost({
    required String name,
    required String category,
    required String subCategory,
    required String description,
    required String image,
  }) async {
    //get email from shared pref

    PostModel specProduct = PostModel(
        userId: currentUser,
        name: name,
        category: category,
        subCategory: subCategory,
        disc: description,
        pic: image);
    // SpecificProductModel postModel = SpecificProductModel(
    //     itemName: name,
    //     category: category,
    //     subCategory: subCategory,
    //     description: description);
    _postCollectionRef
        .doc(currentUser)
        .collection('specificProducts')
        .add(specProduct.toJson())
        .then((value) => emit(AddPostSuccess()))
        .catchError((error) {
      emit(AddPostFailure(error: error.toString()));
    });
  }

  List<PostModel> myNeedList = [];
  bool isNeedListEmpty = false;
  bool isHaveListNotEmpty = false;
  void getMyPosts() {
    myHaveList.clear();
    emit(GetPostLoading());
    _postCollectionRef.doc(currentUser).collection('posts').get().then((value) {
      for (var element in value.docs) {
        myHaveList.add(PostModel.fromJson(element));
      }
      if (myHaveList.isEmpty) {
        isHaveListNotEmpty = true;
      } else {
        isHaveListNotEmpty = false;
      }
      debugPrint('/////////////////');
      debugPrint(myHaveList[1].name);
      debugPrint('/////////////////');
      emit(GetPostSuccess());
    }).catchError((error) {
      emit(GetPostFailure(error: error.toString()));
    });
  }

  void getMyNeedProducts() {
    myNeedList.clear();
    emit(GetSpecPostLoading());
    _postCollectionRef
        .doc(currentUser)
        .collection('specificProducts')
        .get()
        .then((value) {
      for (var element in value.docs) {
        myNeedList.add(PostModel.fromJson(element.data()));
      }
      if (myNeedList.isEmpty) {
        isNeedListEmpty = true;
      } else {
        isNeedListEmpty = false;
      }
      debugPrint('/////////////////');
      debugPrint(myNeedList[1].name);
      debugPrint('/////////////////');
      emit(GetSpecPostSuccess());
    }).catchError((error) {
      emit(GetSpecPostFailure(error: error.toString()));
    });
  }

//Product image
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
    // required String userName,
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
            userName: CacheHelper.getData(key: Constant.kUserName),
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

//specific Product image
  File? specFile;

  Future<void> getSpecifictProductImage() async {
    final xFile = await _imagePicker.getImage(source: ImageSource.gallery);
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

  Future<void> uploadSpecificFile({
    required String name,
    required String category,
    required String subCategory,
    required String disc,
  }) async {
    if (specFile == null) return;
    final fileName = p.basename(specFile!.path);
    final destination = '$currentUser/${Uri.file(fileName).pathSegments.last}';

    final ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Specific Products/$destination');
    await ref.putFile(specFile!).then((value) async {
      await value.ref.getDownloadURL().then((imageUrl) {
        addSpecPost(
            // userName: CacheHelper.getData(key: Constant.kUserName),
            name: name,
            category: category,
            subCategory: subCategory,
            image: imageUrl.toString(),
            description: disc);
      });
      specFile = null;
      emit(UploadSpecificImageSuccessState());
    }).catchError((error) {
      emit(UploadSpecificImageErrorState(error: error));
    });
  }

  List<ProductModel> allProudcts = [];
  void getAllProducts() {
    allProudcts.clear();
    emit(GetAllPRoductsLoading());
    FirebaseFirestore.instance.collection('All Products').get().then((value) {
      for (var post in value.docs) {
        allProudcts.add(ProductModel.fromJson(post));
      }

      emit(GetAllPRoductsSuccess());
    }).catchError((error) {
      emit(GetAllPRoductsFailure(error: error));
    });
  }
}
