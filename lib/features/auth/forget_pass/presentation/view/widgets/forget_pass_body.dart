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
    final cubit = context.read<ForgetPassCubit>();
    return Form(
      key: cubit.forgetKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CustomCenterText(text: 'Forget password'),
          verticalSpace(25),
          Text(
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
                cubit.validateThenDoForgetPassword();
                debugPrint(cubit.verifyEmailController.text);
              }),
          ForgetPassBlocListener(email: cubit.verifyEmailController)
        ],
      ),
    );
  }
}
