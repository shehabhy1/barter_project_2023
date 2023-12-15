import 'dart:developer';

import 'package:barter_project_2023/features/log_in/logic/signupcontrol.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';
import 'cusomt_list_tile_profile.dart';
import 'custom_button_edit_profile.dart';
import 'image_profile_with_image.dart';

class EditProfileBody extends StatefulWidget {
  EditProfileBody({
    super.key,
  });

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  var userProfile = FirebaseFirestore.instance.collection('users');

  TextEditingController firstnamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Edit Profile'),
        titleTextStyle: Styles.textStyle24,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: userProfile
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get()
            .asStream(),
        builder: (builder, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (s.hasError) {
            return Text(s.error.toString());
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ListView(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(s.data!.docs.first['pic']),
                  ),
                  //ImageProfileWithIcon(),
                  Text(
                    '${s.data!.docs.first['firstname']}'
                    ' ${s.data!.docs.first['lastname']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  CustomListTileProfile(
                    title: 'Name',
                    subTitle: '${s.data!.docs.first['firstname']}',
                    trailing: GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          content: TextField(
                            controller: firstnamecontroller,
                            decoration:
                                InputDecoration(hintText: 'update firstname'),
                          ),
                          middleText: 'shehab',
                          title: 'update',
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('cancel')),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    userProfile
                                        .doc(s.data!.docs.first.id)
                                        .update({
                                      'firstname': s
                                          .data!.docs.first['firstname']
                                          .toString()
                                          .replaceAll(
                                              s.data!.docs.first['firstname'],
                                              firstnamecontroller.text),
                                    });
                                    Get.back();
                                  });

                                  //  controller.update();
                                },
                                child: Text('confirm')),
                          ],
                        );
                        /* userProfile
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .set({'firstname': firstnameController.text}); */
                      },
                      child: Image.asset(
                        AssetData.editTextIcon,
                        width: 25,
                        height: 44,
                        color: kGreyColor,
                      ),
                    ),
                  ),

                  CustomListTileProfile(
                    title: 'last name',
                    subTitle: '${s.data!.docs.first['lastname']}',
                    trailing: GestureDetector(
                      onTap: () {
                        userProfile
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .set({'lastname': ''});
                      },
                      child: Image.asset(
                        AssetData.editTextIcon,
                        width: 25,
                        height: 44,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                  CustomListTileProfile(
                    title: 'Email',
                    subTitle: s.data!.docs.first['email'],
                  ),
                  /*  CustomListTileProfile(
                      title: 'Password',
                      subTitle: s.data!.docs.first['password'],
                    ), */
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
