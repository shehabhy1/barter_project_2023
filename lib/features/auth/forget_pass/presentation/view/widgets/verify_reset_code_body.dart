import 'package:barter_app/core/helper/constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/shared_widget/custom_buttom.dart';
import 'package:barter_app/core/shared_widget/error_dialog.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/spacing.dart';

class VerifyResetCodeBody extends StatefulWidget {
  const VerifyResetCodeBody({super.key, required this.email});
  final String? email;

  @override
  State<VerifyResetCodeBody> createState() => _VerifyResetCodeBodyState();
}

class _VerifyResetCodeBodyState extends State<VerifyResetCodeBody> {
  String? codeOtp;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Forget password',
                style: Styles.textStyle32,
              ),
            ),
            verticalSpace(10),
            RichText(
              text: TextSpan(
                text: 'Enter the 6-digital code sent to ',
                children: [
                  TextSpan(
                    text: widget.email

                    // ?? context.read<ForgetPassCubit>().email
                    ,
                    style: TextStyle(
                        color: Constants.primaryColor, fontSize: 16.sp),
                  )
                ],
                style: Styles.textStyle20.copyWith(
                  color: const Color(
                    (0xFF8B8B8B),
                  ),
                ),
              ),
            ),
            verticalSpace(20),
            OtpTextField(
              fillColor: Colors.blue,
              numberOfFields: 6,
              fieldWidth: context.deviceWidth * .11,
              borderRadius: BorderRadius.circular(10),
              autoFocus: true,
              showFieldAsBox: true,
              onCodeChanged: (val) {},
              textStyle: Styles.textStyle20,
              focusedBorderColor: Constants.primaryColor,
              enabledBorderColor: Constants.greyColor,
              onSubmit: (String verificationCode) {
                codeOtp = verificationCode;
                debugPrint(codeOtp.toString());
              },
            ),
            verticalSpace(80),
            CustomButton(
              width: double.infinity,
              height: 60,
              backgroundColor: Constants.primaryColor,
              text: 'Send',
              func: () {
                if (formKey.currentState!.validate()) {
                  context.read<ForgetPassCubit>().verifyResetCode(
                        resetCode: codeOtp!,
                      );
                  debugPrint(widget.email);
                }
                debugPrint(widget.email.toString());
              },
            ),
            VerifyResetCodeBlocListener(
              email: widget.email!,
            )
          ],
        ),
      ),
    );
  }
}

class VerifyResetCodeBlocListener extends StatelessWidget {
  const VerifyResetCodeBlocListener({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPassCubit, ForgetPassState>(
      listenWhen: (previous, current) =>
          current is VerifyResetCodeLoadingState ||
          current is VerifyResetCodeSuccessState ||
          current is VerifyResetCodeErrorState,
      listener: (context, state) {
        if (state is VerifyResetCodeErrorState) {
          dialogErrorState(
            context,
            state.error,
          );
        } else if (state is VerifyResetCodeSuccessState) {
          context.pushReplacementNamed(Routes.resetPassView, arguments: email);
        } else {
          const Center(child: CircularProgressIndicator());
        }
      },
      child: Container(),
    );
  }
}
