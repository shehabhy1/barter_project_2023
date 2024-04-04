import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_state.dart';
import 'package:barter_app/features/profile_screen/presentation/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetUserinfoSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: RefreshIndicator(
                  onRefresh: () async {
                    return await context.read<ProfileCubit>().getMyInfo();
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 20,
                              foregroundImage:
                                  NetworkImage(state.userInfo.data!.image!.url!)
                              // AssetImage('assets/images/PROFIL.png'),
                              ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            // 'Jack Arsany',
                            '${state.userInfo.data!.name}',

                            style: const TextStyle(
                              fontSize: 24,
                              color: Color(0xFFB73BFF),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 12.h,),
                      const Divider(),
                      item(
                          text: 'Profile info',
                          onPressed: () {
                            context.pushNamed(Routes.editProfileView);
                          }),
                      const Divider(),
                      item(
                          text: 'Have & need',
                          onPressed: () {
                            // context.pushNamed(Routes.haveAndNeedView);
                          }),

                      const Divider(),
                      item(
                          text: 'Deal status',
                          onPressed: () {
                            // context.pushNamed(Routes.dealView);
                          }),

                      const Divider(),
                      item(
                          text: 'Settings',
                          onPressed: () {
                            // context.pushNamed(Routes.settingsView);
                          }),

                      const Divider(),
                      item(
                          text: 'All Reports',
                          onPressed: () {
                            // context.pushNamed(Routes.reportView);
                          }),

                      const Divider(),
                      item(
                          text: 'Submit Report',
                          onPressed: () {
                            // context.pushNamed(Routes.reportDetailsView);
                          }),

                      const Divider(),
                      // Row(
                      //   children: [
                      //     const Text(
                      //       'Notification',
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //     const Spacer(),
                      //     GFToggle(
                      //       onChanged: (val) {},
                      //       value: true,
                      //       enabledThumbColor: Colors.grey,
                      //       type: GFToggleType.ios,
                      //     )
                      //   ],
                      // ),
                      // const Divider(),
                      const ShowAlertDialog(),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is GetUserinfoErrorState) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget item({required text, required void Function()? onPressed}) => Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: onPressed,
              child: const Icon(Icons.arrow_forward_ios_outlined)),
        ],
      );
}
