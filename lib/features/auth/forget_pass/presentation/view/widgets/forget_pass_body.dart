import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/core/shared_widget/app_text_field.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/forget_pass_bloc_listener.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/custom_center_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper/app_regex_helper.dart';
import 'linear_progress_indicator_builder.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPassCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCenterText(text: 'Forget password'),
            verticalSpace(25),
            const Text(
              'Email',
              style: AppStyles.semiBold20,
            ),
            verticalSpace(8),
            AppTextFiled(
              type: TextInputType.emailAddress,
              controller: context.read<ForgetPassCubit>().verifyEmailController,
              hint: 'Write Your Email',
              validate: (val) {
                if (val == null || val.isEmpty || !AppRegex.isEmailValid(val)) {
                  return "Please enter a valid email";
                }
              },
            ),
            verticalSpace(40),
            const LinearProgressIndicatorBuilder(),
            verticalSpace(5),
            AppButton(
                text: 'Send',
                onPressed: () {
                  context
                      .read<ForgetPassCubit>()
                      .validateThenDoForgetPassword();
                  debugPrint(
                    context.read<ForgetPassCubit>().verifyEmailController.text,
                  );
                }),
            ForgetPassBlocListener(
              email: context.read<ForgetPassCubit>().verifyEmailController,
            )
          ],
        ),
      ),
    );
  }
}
