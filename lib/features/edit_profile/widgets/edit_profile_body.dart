import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/cash_helper/cache_helper.dart';
import '../../../core/helper/cash_helper/cash_helper_constants.dart';
import 'cusomt_list_tile_profile.dart';
import 'image_picker/show_image_dialog.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetProfileCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: cubit.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileImageDialoge(
                imageUrl: CachHelper.getData(key: CashConstants.userImage),
              ),
              verticalSpace(5),
              Text(
                CachHelper.getData(key: CashConstants.userName),
                textAlign: TextAlign.center,
                style: AppStyles.medium24.copyWith(fontWeight: FontWeight.w400),
              ),
              verticalSpace(20),
              CustomListTileProfile(
                title: 'Name',
                subTitle: CachHelper.getData(key: CashConstants.userName),
                controller: cubit.nameController,
              ),
              CustomListTileProfile(
                title: 'Password',
                subTitle: '**********',
                controller: cubit.passwordController,
              ),
              CustomListTileProfile(
                title: 'Phone Number',
                subTitle: CachHelper.getData(key: CashConstants.userNumber),
                controller: cubit.phoneController,
              ),
              CustomListTileProfile(
                title: 'WhatsApp Number',
                subTitle: CachHelper.getData(key: CashConstants.userWhatsApp),
                controller: cubit.whatsController,
              ),
              verticalSpace(50),
              AppButton(
                text: 'Saved Changes',
                onPressed: () {
                  // cubit.whatsController.text.isEmpty
                  //     ? debugPrint('Null')
                  //     : debugPrint(cubit.whatsController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
