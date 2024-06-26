import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/view/widgets/linear_progress_indicator_builder.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/custom_center_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../model_view/cubit/forget_pass_cubit.dart';
import 'otp_text_field.dart';
import 'verify_reset_code_listener.dart';

class VerifyResetCodeBody extends StatelessWidget {
  final String? email;

  const VerifyResetCodeBody({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPassCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCenterText(text: 'Forget password'),
            verticalSpace(10),
            RichText(
              text: TextSpan(
                text: 'Enter the 6-digital code sent to ',
                children: [
                  TextSpan(
                    text: email,
                    // ?? context.read<ForgetPassCubit>().email

                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 16.sp),
                  )
                ],
                style: AppStyles.semiBold20.copyWith(
                  color: const Color((0xFF8B8B8B)),
                ),
              ),
            ),
            verticalSpace(20),
            const OtpTextFieldWidget(),
            verticalSpace(80),
            const LinearProgressIndicatorBuilder(),
            verticalSpace(5),
            AppButton(
              text: 'Send',
              onPressed: () {
                context.read<ForgetPassCubit>().validateThenDoVerifyResetCode();
                debugPrint(email);
              },
            ),
            VerifyResetCodeBlocListener(
              email: email!,
            )
          ],
        ),
      ),
    );
  }
}
