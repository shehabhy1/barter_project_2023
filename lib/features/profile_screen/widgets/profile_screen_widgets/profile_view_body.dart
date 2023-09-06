import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/profile_screen/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                      radius: 20,
                      foregroundImage: AssetImage('assets/images/PROFIL.png')),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text(
                    'Jack Arsany',
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
                        context.pushNamed(AppRouter.editProfile);
                      },
                      child: const Icon(Icons.arrow_forward_ios_outlined)),
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
                      child: const Icon(Icons.arrow_forward_ios_outlined)),
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
                      child: const Icon(Icons.arrow_forward_ios_outlined)),
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
                      child: const Icon(Icons.arrow_forward_ios_outlined)),
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
                      child: const Icon(Icons.arrow_forward_ios_outlined)),
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
                      child: const Icon(Icons.arrow_forward_ios_outlined)),
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
        ),
      ),
    );

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
  }
}
