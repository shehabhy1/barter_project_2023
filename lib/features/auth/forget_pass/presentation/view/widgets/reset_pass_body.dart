import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/reset_pass_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper/app_regex_helper.dart';
import '../../../../../../core/shared_widget/app_buttom.dart';
import '../../../../../../core/shared_widget/app_text_field.dart';
import '../../../../../../core/shared_widget/password_and_validation.dart';
import '../../../../../../core/utils/styles.dart';
import 'linear_progress_indicator_builder.dart';

class ResetPassBody extends StatelessWidget {
  const ResetPassBody({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPassCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'New password',
                  style: AppStyles.bold32,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Email',
                style: AppStyles.semiBold20,
              ),
              const SizedBox(height: 8),
              AppTextFiled(
                controller: TextEditingController(text: email),
                readOnly: true,
                type: TextInputType.text,
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
                'New Password',
                style: AppStyles.semiBold20,
              ),
              const SizedBox(height: 8),
              PasswordAndValidation(
                controller: context.read<ForgetPassCubit>().newPassController,
              ),
              const SizedBox(height: 40),
              const LinearProgressIndicatorBuilder(),
              verticalSpace(10),
              AppButton(
                  text: 'Send',
                  onPressed: () {
                    context
                        .read<ForgetPassCubit>()
                        .validateThenDoResetPassword(email);
                  }),
              const ResetPassBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}
