import 'package:flutter/material.dart';
import '../../../../../../core/helper/app_regex_helper.dart';
import '../../../../../../core/shared_widget/app_text_field.dart';
import '../../../../../../core/utils/styles.dart';
import '../../veiw_model/cubit/register_cubit.dart';

class SignUpTextFieldPart extends StatelessWidget {
  final RegisterCubit cubit;
  const SignUpTextFieldPart({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
         Text(
          'Full Name',
          style: AppStyles.semiBold20,
        ),
        const SizedBox(height: 8),
        AppTextFiled(
            controller: cubit.nameController,
            type: TextInputType.text,
            hint: 'Write your Full Name',
            validate: (val) {
              if (val == null || val.isEmpty) {
                return 'Name is required';
              }
            }),
        const SizedBox(height: 16),
         Text(
          'Email',
          style: AppStyles.semiBold20,
        ),
        const SizedBox(height: 8),
        AppTextFiled(
          controller: cubit.emailController,
          type: TextInputType.emailAddress,
          hint: 'Write your Email',
          validate: (val) {
            if (val == null || val.isEmpty || !AppRegex.isEmailValid(val)) {
              return "Please enter a valid email";
            }
          },
        ),
        const SizedBox(height: 16),
         Text(
          'Phone',
          style: AppStyles.semiBold20,
        ),
        const SizedBox(height: 8),
        AppTextFiled(
          controller: cubit.phoneController,
          type: TextInputType.phone,
          hint: 'Write your Phone',
          validate: (val) {
            if (val == null ||
                val.isEmpty ||
                val.length > 11 ||
                !AppRegex.validatePhoneNumber(val)) {
              return "Please enter a valid phone";
            }
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
