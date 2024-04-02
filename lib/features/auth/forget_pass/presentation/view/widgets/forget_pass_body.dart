import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/core/shared_widget/app_text_field.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/forget_pass_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper/app_regex_helper.dart';
import '../../model_view/cubit/forget_pass_state.dart';

class ForgetPassBody extends StatefulWidget {
  const ForgetPassBody({super.key});

  @override
  State<ForgetPassBody> createState() => _ForgetPassBodyState();
}

class _ForgetPassBodyState extends State<ForgetPassBody> {
  @override
  void dispose() {
    // verifyEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPassCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Forget password',
                style: Styles.textStyle32,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email',
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 8,
            ),
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
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<ForgetPassCubit, ForgetPassState>(
              builder: (context, state) {
                if (state is ForgetPassLoadingState) {
                  return const LinearProgressIndicator();
                } else {
                  return const SizedBox();
                }
              },
            ),
            AppButton(
                text: 'Send',
                func: () {
                  context.read<ForgetPassCubit>().validateThenDoLogin();
                  debugPrint(context
                      .read<ForgetPassCubit>()
                      .verifyEmailController
                      .text);
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
