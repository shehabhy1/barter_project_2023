import 'package:barter_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/helper/app_regex_helper.dart';
import '../../../../../../core/shared_widget/app_text_field.dart';
import '../../../../../../core/shared_widget/password_and_validation.dart';
import '../../../../../../core/utils/styles.dart';
import '../../veiw_model/cubit/register_cubit.dart';

class PhoneAnsPasswordTextFieldPart extends StatelessWidget {
  final RegisterCubit cubit;
  const PhoneAnsPasswordTextFieldPart({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'WhatsApp Number',
          style: Styles.textStyle20,
        ),
        const SizedBox(height: 8),
        AppTextFiled(
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SvgPicture.asset(
              Assets.egyptFlag,
            ),
          ),
          controller: context.read<RegisterCubit>().whatsController,
          type: TextInputType.phone,
          prefixIconConstraints:
              BoxConstraints(maxWidth: 50.w, maxHeight: 50.h),
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
        ),
        const SizedBox(height: 16),
        const Text(
          'Password',
          style: Styles.textStyle20,
        ),
        const SizedBox(height: 8),
        PasswordAndValidation(controller: cubit.passwordController),
      ],
    );
  }
}
