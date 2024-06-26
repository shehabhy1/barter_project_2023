import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/features/edit_profile/view_model/update_user_cubit/update_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_profile_bloc_listener.dart';
import 'edit_user_form.dart';
import '../../../core/shared_widget/upload_image/image_of_profile.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UpdateUserCubit>();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        verticalSpace(20),
        const ImageProfile(isProfile: true),
        EditUserForm(cubit: cubit),
        AppButton(
          text: 'Saved Changes',
          onPressed: () {
            cubit.updateUserInfo();
          },
        ),
        const EditProfileBlocListener(),
      ],
    );
  }
}
