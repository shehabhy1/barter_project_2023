import 'package:barter_app/core/helper/app_regex_helper.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/app_text_field.dart';
import '../../../../../../core/shared_widget/password_and_validation.dart';
import '../../../../../../core/utils/styles.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: AppStyles.semiBold20,
              ),
              const SizedBox(height: 8),
              AppTextFiled(
                type: TextInputType.emailAddress,
                hint: 'Write your Email',
                controller: cubit.emailController,
                validate: (val) {
                  if (val == null ||
                      val.isEmpty ||
                      !AppRegex.isEmailValid(val)) {
                    return "Please enter a valid email";
                  }
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Password',
                style: AppStyles.semiBold20,
              ),
              const SizedBox(height: 8),
              PasswordAndValidation(
                controller: cubit.passwordController,
              ),
            ],
          ),
        );
      },
    );
  }
}
