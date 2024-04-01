import 'package:barter_app/core/helper/constants.dart';
import 'package:barter_app/core/shared_widget/custom_buttom.dart';
import 'package:barter_app/core/shared_widget/default_text.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/forget_pass_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassBody extends StatefulWidget {
  const ForgetPassBody({super.key});

  @override
  State<ForgetPassBody> createState() => _ForgetPassBodyState();
}

class _ForgetPassBodyState extends State<ForgetPassBody> {
  TextEditingController verifyEmailController = TextEditingController();
  @override
  void dispose() {
    // verifyEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          defaultText(
              type: TextInputType.emailAddress,
              controller: verifyEmailController,
              hint: 'Write Your Email'),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              width: double.infinity,
              height: 60,
              backgroundColor: Constants.primaryColor,
              text: 'Send',
              func: () {
                context
                    .read<ForgetPassCubit>()
                    .emitForgetPassStates(email: verifyEmailController.text);
                debugPrint(verifyEmailController.text);
              }),
          ForgetPassBlocListener(
            email: verifyEmailController,
          )
        ],
      ),
    );
  }
}
