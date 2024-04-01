import 'package:barter_app/core/shared_widget/default_text.dart';
import 'package:barter_app/core/shared_widget/radio_buttom.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldsOfRegister extends StatelessWidget {
  const FieldsOfRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'First Name',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 8,
          ),
          defaultText(
              controller: context.read<RegisterCubit>().fNameController,
              type: TextInputType.text,
              hint: 'Write your First Name',
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Name is required';
                }
                return null;
              }),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Last Name',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 8,
          ),
          defaultText(
              controller: context.read<RegisterCubit>().lNameController,
              type: TextInputType.text,
              hint: 'Write your Last Name',
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Name is required';
                }
                return null;
              }),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Email',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 8,
          ),
          defaultText(
            controller: context.read<RegisterCubit>().emailController,
            type: TextInputType.emailAddress,
            hint: 'Write your Email',
            validate: (value) {
              if (value!.isEmpty ) {
                return 'Email is Wrong You must write .com';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Phone',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 8,
          ),
          defaultText(
            controller: context.read<RegisterCubit>().phoneController,
            type: TextInputType.phone,
            hint: 'Write your Phone',
            validate: (value) {
              if (value!.isEmpty) {
                return 'phone is Wrong ';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const RadioCheck(),
          const Text(
            'Password',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 8,
          ),
          defaultText(
            controller: context.read<RegisterCubit>().passwordController,
            type: TextInputType.visiblePassword,
            hint: 'Write your password',
            validate: (val) {
              if (val.isEmpty || val.length < 6 || val.length > 16) {
                return 'Password should contain at least 1 special character,the length should be \n between 6 to 16  character';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
