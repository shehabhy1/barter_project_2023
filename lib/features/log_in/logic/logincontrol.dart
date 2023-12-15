import 'dart:developer';

import 'package:barter_project_2023/features/home/presentation/view/home_view.dart';
import 'package:barter_project_2023/features/profilenavbar/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlLogin extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isPasswordHidden = true;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    ControlLogin();
    // TODO: implement onClose
    super.onClose();
  }

  void login() async {
    try {
      // ignore: unused_local_variable
      UserCredential usercredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      log('success');
      Get.offAll(() => const UserLayout());
      //Get.offAll(() => ViewUserData());
      /* Get.snackbar(
          'Account Exists',
          'You entered the same email and password as the signup screen.',
          snackPosition: SnackPosition.BOTTOM,
        ); */
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        Get.showSnackbar(GetSnackBar(
          message: 'الايميل غير موجود',
        ));
      } else {
        log(e.toString());
      }
    }
    update();
  }
}
