import 'package:flutter/material.dart';
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
        const Text(
          'Full Name',
          style: Styles.textStyle20,
        ),
        const SizedBox(height: 8),
        AppTextFiled(
            controller: cubit.nameController,
            type: TextInputType.text,
            hint: 'Write your Full Name',
            validate: (value) {
              if (value!.isEmpty) {
                return 'Name is required';
              }
              return null;
            }),
        const SizedBox(height: 16),
        const Text(
          'Email',
          style: Styles.textStyle20,
        ),
        const SizedBox(height: 8),
        AppTextFiled(
          controller: cubit.emailController,
          type: TextInputType.emailAddress,
          hint: 'Write your Email',
          validate: (value) {
            if (value!.isEmpty) {
              return 'Email is Wrong You must write .com';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'Phone',
          style: Styles.textStyle20,
        ),
        const SizedBox(height: 8),
        AppTextFiled(
          controller: cubit.phoneController,
          type: TextInputType.phone,
          hint: 'Write your Phone',
          validate: (value) {
            if (value!.isEmpty) {
              return 'phone is Wrong ';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
