import 'package:barter_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/helper/app_regex_helper.dart';
import '../../../../../../core/shared_widget/app_text_field.dart';
import '../../veiw_model/cubit/register_cubit.dart';

class WhatsAppField extends StatelessWidget {
  const WhatsAppField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFiled(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SvgPicture.asset(
          Assets.egyptFlag,
        ),
      ),
      controller: context.read<RegisterCubit>().whatsController,
      prefixIconConstraints: BoxConstraints(maxWidth: 50.w, maxHeight: 50.h),
      type: TextInputType.visiblePassword,
      hint: 'Write your WhatsApp number',
      validate: (val) {
        if (val.isEmpty ||
            val.length < 0 ||
            val.length > 11 ||
            !AppRegex.validatePhoneNumber(val)) {
          return 'Please enter a valid Egyptian phone number';
        }
        return null;
      },
    );
  }
}
