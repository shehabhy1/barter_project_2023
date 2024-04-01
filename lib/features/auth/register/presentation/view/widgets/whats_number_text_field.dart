import 'package:barter_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      controller: context.read<RegisterCubit>().passwordController,
      prefixIconConstraints: BoxConstraints(maxWidth: 50.w, maxHeight: 50.h),
      type: TextInputType.visiblePassword,
      hint: 'Write your WhatsApp number',
      validate: (val) {
        if (val.isEmpty || val.length < 6 || val.length > 16) {
          return 'Password should contain at least 1 special character,the length should be \n between 6 to 16  character';
        }
        return null;
      },
    );
  }
}
