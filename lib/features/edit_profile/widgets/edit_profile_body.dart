// ignore_for_file: prefer_const_constructors

import 'package:barter_project_2023/features/edit_profile/widgets/image_profile_with_image.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cusomt_list_tile_profile.dart';
import 'custom_button_edit_profile.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({
    super.key,
  });

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  var fNameController = TextEditingController();
  var lnameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fNameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          var userData = ProfileCubit.get(context).userModel;
          fNameController.text = userData!.fName;
          lnameController.text = userData.lName;
          String pass = userData.password.replaceRange(
            0,
            userData.password.length,
            '*' * userData.password.length,
          );

          emailController.text = userData.email;
          passController.text = pass;
          //TO replace password to asterisks

          return ListView(
            children: [
              ImageProfileWithIcon(),
              Text(
                '${userData.fName} ' '${userData.lName}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              CustomListTileProfile(
                  title: 'First Name', controller: fNameController),
              CustomListTileProfile(
                  title: 'Last Name', controller: lnameController),
              CustomListTileProfile(
                  title: 'Email', controller: emailController),
              CustomListTileProfile(
                  title: 'Password', controller: passController),
              // if (state is UpdateProfileDataLoadingState)
              //   const LinearProgressIndicator(),
              // if (state is UpdateProfileDataLoadingState) SizedBox(height: 10),
              CustomButtonEditProfile(
                onPressed: () {
                  ProfileCubit.get(context).updateUserData(
                    fName: fNameController.text,
                    lName: lnameController.text,
                    email: emailController.text,
                    password: passController.text,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
