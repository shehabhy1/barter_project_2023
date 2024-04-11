import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/app_constants.dart';
import '../../../core/utils/cache_helper.dart';
import 'cusomt_list_tile_profile.dart';
import 'image_picker/show_image_dialog.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: cubit.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileImageDialoge(
                imageUrl: CacheHelper.getData(key: AppConstants.kUserImage),
              ),
              verticalSpace(5),
              Text(
                CacheHelper.getData(key: AppConstants.kUserName),
                textAlign: TextAlign.center,
                style: AppStyles.medium24.copyWith(fontWeight: FontWeight.w400),
              ),
              verticalSpace(20),
              CustomListTileProfile(
                title: 'Name',
                subTitle: CacheHelper.getData(key: AppConstants.kUserName),
                controller: cubit.nameController,
              ),
              CustomListTileProfile(
                title: 'Password',
                subTitle: '**********',
                controller: cubit.passwordController,
              ),
              CustomListTileProfile(
                title: 'Phone Number',
                subTitle: CacheHelper.getData(key: AppConstants.kUserNumber),
                controller: cubit.phoneController,
              ),
              CustomListTileProfile(
                title: 'WhatsApp Number',
                subTitle:
                    CacheHelper.getData(key: AppConstants.kUserWhatsAppNumber),
                controller: cubit.whatsController,
              ),
              verticalSpace(50),
              AppButton(
                text: 'Saved Changes',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
