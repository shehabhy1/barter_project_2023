import 'package:barter_app/core/helper/app_regex_helper.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/app_text_field.dart';
import '../../../../../../core/shared_widget/password_and_validation.dart';
import '../../../../../../core/utils/styles.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is LoginLoadingState ? true : false,
          child: Form(
            key: context.read<LoginCubit>().formKey,
            autovalidateMode: context.read<LoginCubit>().autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: Styles.textStyle20,
                ),
                const SizedBox(height: 8),
                AppTextFiled(
                  type: TextInputType.emailAddress,
                  hint: 'Write your Email',
                  controller: context.read<LoginCubit>().emailController,
                  validate: (val) {
                    if (val == null ||
                        val.isEmpty ||
                        !AppRegex.isEmailValid(val)) {
                      return "Please enter a valid email";
                    }
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: Styles.textStyle20,
                ),
                const SizedBox(height: 8),
                PasswordAndValidation(
                  controller: context.read<LoginCubit>().passwordController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
