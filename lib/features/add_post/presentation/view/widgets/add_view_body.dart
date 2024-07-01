import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/features/add_post/presentation/view/view_model/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/app_constants.dart';
import '../../../../../core/pick_image_cubit/pick_image_cubit.dart';
import '../../../../../core/shared_widget/radio_buttom.dart';
import '../../../../../core/utils/styles.dart';
import 'bottom_section_build.dart';
import 'build_image_post.dart';
import 'dropdown_text_section.dart';

class AddViewBody extends StatelessWidget {
  const AddViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final imageCubit = context.read<PickImageCubit>();
    final postCubit = context.read<PostCubit>();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        BuildImagePost(cubit: imageCubit),
        const DropdownTextSection(),
        RadioCheck(
          text: 'Do you want to exchange a specific product?',
          tittleOne: 'Yes',
          tittleTwo: 'No',
          isAddPost: true,
          postCubit: postCubit,
        ),
        verticalSpace(10),
        const BottomSectionBuilder(),
        AppButton(
          text: 'Publish',
          onPressed: () {},
          buttonHeight: 45,
          style: AppStyles.semiBold20
              .copyWith(fontSize: 16.sp, color: AppColors.white),
        ),
        verticalSpace(50),
      ],
    );
  }
}
