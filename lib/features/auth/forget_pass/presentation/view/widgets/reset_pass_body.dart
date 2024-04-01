import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/reset_pass_bloc_lstener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/constants.dart';
import '../../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../../core/shared_widget/default_text.dart';
import '../../../../../../core/utils/styles.dart';

class ResetPassBody extends StatefulWidget {
  const ResetPassBody({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<ResetPassBody> createState() => _ResetPassBodyState();
}

class _ResetPassBodyState extends State<ResetPassBody> {
  TextEditingController newPassController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    newPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'New password',
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
              controller: TextEditingController(text: widget.email),
              readOnly: true,
              type: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'New Password',
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 8,
            ),
            defaultText(
                controller: newPassController,
                type: TextInputType.visiblePassword,
                hint: 'Write your password'),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                width: double.infinity,
                height: 60,
                backgroundColor: Constants.primaryColor,
                text: 'Send',
                func: () {
                  context.read<ForgetPassCubit>().resetPassword(
                      email: widget.email, pass: newPassController.text);
                }),
            const ResetPassBlocListener()
          ],
        ),
      ),
    );
  }
}
