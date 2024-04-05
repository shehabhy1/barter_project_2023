import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../profile_screen/data/models/user_info_model.dart';
import 'cusomt_list_tile_profile.dart';
import 'image_profile_with_image.dart';

class EditProfileBody extends StatelessWidget {
  final UserInfo user;

  const EditProfileBody({super.key, required this.user});

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
              user.data!.name!,
              textAlign: TextAlign.center,
              style: AppStyles.medium24.copyWith(fontWeight: FontWeight.w400),
            ),
            CustomListTileProfile(
              title: 'Name',
              subTitle: user.data!.name!,
              controller: context.read<ProfileCubit>().nameController,
            ),
            CustomListTileProfile(
              title: 'Password',
              subTitle: '**********',
              controller: context.read<ProfileCubit>().passwordController,
            ),
            CustomListTileProfile(
              title: 'Phone Number',
              subTitle: user.data!.phone!,
              controller: context.read<ProfileCubit>().phoneController,
            ),
            CustomListTileProfile(
              title: 'WhatsApp Number',
              subTitle: user.data!.whatsapp!,
              controller: context.read<ProfileCubit>().whatsController,
            ),
            verticalSpace(35),
            AppButton(
              text: 'Saved Changes',
              onPressed: () {},
            ),
            // const CustomButtonEditProfile(),
          ],
        ),
      ),
    );
  }
}
