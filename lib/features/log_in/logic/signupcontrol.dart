import 'dart:developer';
import 'dart:io';

import 'package:barter_project_2023/features/log_in/logic/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ControlSignUp extends GetxController {
  
  final auth = FirebaseAuth.instance;
  bool isLoading = true;
  File? file;
  // resbonsible for the sign up screen
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  String gender = 'male';
// List userData = [];
// CollectionReference documentReference =
//     FirebaseFirestore.instance.collection('users');
  var isPasswordHidden = true;
  var isEmailVerified = false;
  //final FirebaseAuths = FirebaseFirestore.instance.collection('users');

//////////////////////////////////////////////////
  @override
  void onInit() {
    super.onInit();
  }

  void selectImage() async {
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      /* final ref = FirebaseStorage.instance.ref('images');
      await ref.putFile(file!);
      imgUrl = ref.getDownloadURL(); */
    }

    update();
  }
////////////////////////

  ///
  // PlatformFile? pickedfile;

  void signout() async {
    try {
      await auth.signOut();
      // Get.offAll(() => CreateAccount());
    } catch (e) {
      Get.snackbar(
        'Signout Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //////////////////////////////////////////
  //////////////////////////////////////////

  void signup() async {
    try {
      if (emailController.text.isEmpty) {
        Get.showSnackbar(GetSnackBar(
          title: '56555555555555',
          message: '56555555555555',
        ));
      } else {
        final filename = p.basename(file!.path);
        final destination = Uri.file(filename).pathSegments.last;
        Reference storageReference =
            FirebaseStorage.instance.ref().child('user images/$destination');
        await storageReference.putFile(file!);
        String imgUrl = await storageReference.getDownloadURL();
        await auth
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
            .then((value) async {
          /* UserModel user = UserModel(
              id: auth.currentUser!.uid,
              fName: firstNameController.text,
              lName: lastNameController.text,
              email: emailController.text,
              password: passwordController.text,
              pic: imgUrl,
              gender: gender); */
          //Map<String, dynamic> userData = user.toJson();
          await FirebaseFirestore.instance.collection('users').add({
            'id': auth.currentUser!.uid,
            'firstname': firstNameController.text,
            'lastname': lastNameController.text,
            'email': emailController.text,
            'pic': imgUrl,
          });
          // user.id.replaceAll(auth.currentUser!.uid, auth.currentUser!.email.toString());
          log('success');
        });
        update();
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      // Show an error message if signup fails
    } finally {
      isLoading = false;
    }
    update();
  }
}
  /* getData() async {
    var resBody = await documentReference.get();
    resBody.docs.forEach(
      (element) {
        userData.add(element.data());
      },
    );
    log(userData.toString());
    update();
  }
} */
 /*   await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => value.docs.forEach((element) {
              log(element.reference.toString());
              userData.add(element.reference.id);
            })); */

            /* 
            get multiple data 
            Future getData() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    for (var element in querySnapshot.docs) {
      userData.add(element.data());
      update();
    }
    // userData.add(querySnapshot.docs);
    log(userData.toString());
    update();
   
  }
             */