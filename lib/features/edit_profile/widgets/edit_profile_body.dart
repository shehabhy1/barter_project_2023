import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cusomt_list_tile_profile.dart';
import 'image_profile_with_image.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: context.read<ProfileCubit>().formKey,
        child: ListView(
          children: [
            const ImageProfileWithIcon(),
            Text(
              'Ali Arsany',
              textAlign: TextAlign.center,
              style: AppStyles.medium24.copyWith(fontWeight: FontWeight.w400),
            ),
            CustomListTileProfile(
              title: 'Name',
              subTitle: 'Ali Arsany',
              controller: context.read<ProfileCubit>().nameController,
            ),
            CustomListTileProfile(
              title: 'Password',
              subTitle: '**********',
              controller: context.read<ProfileCubit>().passwordController,
            ),
            CustomListTileProfile(
              title: 'Phone Number',
              subTitle: '01022352587',
              controller: context.read<ProfileCubit>().phoneController,
            ),
            CustomListTileProfile(
              title: 'WhatsApp Number',
              subTitle: '01149315420',
              controller: context.read<ProfileCubit>().whatsController,
            ),
            verticalSpace(25),
            AppButton(
              text: 'Saved Changes',
              func: () {},
            ),
            // const CustomButtonEditProfile(),
          ],
        ),
      ),
    );
  }
}
