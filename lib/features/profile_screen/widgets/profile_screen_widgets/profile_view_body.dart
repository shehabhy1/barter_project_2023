import 'dart:developer';

import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/edit_profile/edit_profile_view.dart';
import 'package:barter_project_2023/features/edit_profile/widgets/edit_profile_body.dart';
import 'package:barter_project_2023/features/home/presentation/view/home_view.dart';
import 'package:barter_project_2023/features/log_in/logic/signupcontrol.dart';
import 'package:barter_project_2023/features/profile_screen/widgets/show_alert_dialog.dart';
import 'package:barter_project_2023/features/profilenavbar/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({Key? key}) : super(key: key);
//  final con = Get.put(ControlSignUp());
  //var collection = FirebaseFirestore.instance.collection('users');
  //List users = [];
  var userInfo = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.showSnackbar(GetSnackBar(
                duration: Duration(seconds: 2),
                titleText: Text('see it'),
                messageText: Text('use your navigations bars man'),
              ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: StreamBuilder(
          stream: userInfo
              .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get()
              .asStream(),
          builder: (builder, s) {
            if (s.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Container(
                child: CircularProgressIndicator(),
              ));
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20,
                            foregroundImage:
                                NetworkImage(s.data!.docs.first['pic'])),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          s.data!.docs.first['firstname'],
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFB73BFF),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 12.h,),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'Profile info',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              Get.to(EditProfileBody());
                              //context.pushNamed(AppRouter.editProfile);
                            },
                            child:
                                const Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'Have & need',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              context.pushNamed(AppRouter.kHaveAndNeedView);
                            },
                            child:
                                const Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'Deal status',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              context.pushNamed(AppRouter.kDealView);
                            },
                            child:
                                const Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              context.pushNamed(AppRouter.settingsView);
                            },
                            child:
                                const Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'All Reports',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              context.pushNamed(AppRouter.kReportView);
                            },
                            child:
                                const Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'Submit Report',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              context.pushNamed(AppRouter.kReportDetailsView);
                            },
                            child:
                                const Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        GFToggle(
                          onChanged: (val) {},
                          value: true,
                          enabledThumbColor: Colors.grey,
                          type: GFToggleType.ios,
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        ShowAlertDialog()
                        // TextButton(
                        //     onPressed: () {

                        //     },
                        //     child: Text(
                        //       'Logout',
                        //       style: Styles.textStyle20.copyWith(color: Colors.black),
                        //     ))
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
} 
          
        
      
/* GetBuilder<ControlSignUp>(
            init: ControlSignUp(),
            builder: (controller) => FutureBuilder(
                future: userInfo.get(),
                builder: (builder, s) {
                  if (s.hasData) {
                    return ListView.builder(
                        itemCount: s.data!.docs.length,
                        itemBuilder: (itemBuilder, i) {
                          return Column(
                            children: [
                              Text(s.data?.docs[i].data()['firstname']),
                              //Text('data')
                            ],
                          );
                        });
                  } 
                  
                  else {
                    return Container(
                      child: const Center(
                        child: Text(
                          '.......جاري تحميل البيانات',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    );
                  }
                }))); */
    //  Scaffold(
    //   appBar: AppBar(
    //     title: Center(child: Text('profile',style: TextStyle(
    //       color: Colors.black,
    //     ),

    //     )),
    //     backgroundColor: Colors.white,
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 12.h),
    //       child: Column(
    //         children:
    //         [
    //         Row(
    //           children:
    //           [
    //             CircleAvatar(
    //               radius: 20,
    //               foregroundImage: AssetImage('assets/images/PROFIL.png')),
    //             SizedBox(
    //              width: 8.w,
    //             ),
    //             Text('Jack Arsany',
    //             style: TextStyle(
    //               fontSize: 24,
    //               color: Color(0xFFB73BFF),
    //             ),
    //             ),
    //           ],
    //         ),
    //        // SizedBox(height: 12.h,),
    //           Divider(),
    //         Row(
    //           children:
    //           [
    //             Text('Profile info',style:
    //             TextStyle(
    //               fontSize: 20,
    //             ),),
    //            Spacer(),
    //             TextButton(
    //                 onPressed: (){},
    //                 child:
    //                 Icon(Icons.arrow_forward_ios_outlined)),
    //           ],
    //         ),
    //           Divider(),
    //         Row(
    //           children:
    //           [
    //             Text('Have & need',style:
    //             TextStyle(
    //               fontSize: 20,
    //             ),),
    //             Spacer(),
    //             TextButton(
    //                 onPressed: (){},
    //                 child:
    //                 Icon(Icons.arrow_forward_ios_outlined)),
    //           ],
    //         ),
    //           Divider(),
    //         Row(
    //           children:
    //           [
    //             Text('Deal status',style:
    //             TextStyle(
    //               fontSize: 20,
    //             ),),
    //             Spacer(),
    //             TextButton(
    //                 onPressed: (){},
    //                 child:
    //                 Icon(Icons.arrow_forward_ios_outlined)),
    //           ],
    //         ),
    //           Divider(),
    //         Row(
    //           children:
    //           [
    //             Text('Settings',style:
    //             TextStyle(
    //               fontSize: 20,
    //             ),),
    //             Spacer(),
    //             TextButton(
    //                 onPressed: (){},
    //                 child:
    //                 Icon(Icons.arrow_forward_ios_outlined)),
    //           ],
    //         ),
    //           Divider(),
    //         Row(
    //           children:
    //           [
    //             Text('All Reports',style:
    //             TextStyle(
    //               fontSize: 20,
    //             ),),
    //             Spacer(),
    //             TextButton(
    //                 onPressed: (){},
    //                 child:
    //                 Icon(Icons.arrow_forward_ios_outlined)),
    //           ],
    //         ),
    //           Divider(),
    //         Row(
    //           children:
    //           [
    //             Text('Submit Report',style:
    //             TextStyle(
    //               fontSize: 20,
    //             ),),
    //             Spacer(),
    //             TextButton(
    //                 onPressed: (){},
    //                 child:
    //                 Icon(Icons.arrow_forward_ios_outlined)),
    //           ],
    //         ),
    //           Divider(),
    //         Row(
    //           children:
    //           [
    //             Text('Notification',style:
    //             TextStyle(
    //               fontSize: 20,
    //             ),),
    //             Spacer(),
    //             GFToggle(
    //               onChanged: (val){},
    //               value: true,
    //               enabledThumbColor:Colors.grey,
    //               type: GFToggleType.ios,
    //             )
    //           ],
    //         ),
    //           Divider(),
    //           Row(
    //             children:
    //             [
    //               Text('Logout',style:
    //               TextStyle(
    //                 fontSize: 20,
    //               ),),

    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  

/*  */



      /* 
      will return the specific item based on uid
      FutureBuilder(
                future: userInfo
                    .where('id',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (builder, s) {
                  if (s.hasData) {
                    return ListView.builder(
                        itemCount: s.data!.docs.length,
                        itemBuilder: (itemBuilder, i) {
                          return Text(s.data?.docs[i].data()['firstname']);
                        });
                  } else {
                    return Container(
                      child: const Center(
                        child: Text(
                          '.......جاري تحميل البيانات',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    );
                  }
                })));
       */