import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/assets.dart';
import '../view_model/cubit/post_cubit.dart';
import 'dropdown_text_section.dart';

class BottomSectionBuilder extends StatelessWidget {
  const BottomSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      buildWhen: (previous, current) => current is VisabilityState,
      builder: (context, state) {
        if (state is VisabilityState && state.isVisible) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(Assets.imagesLogoIcon)),
              verticalSpace(25),
              Text(
                'What are you want?',
                style: AppStyles.medium16.copyWith(fontSize: 22.sp),
              ),
              const DropdownTextSection(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
