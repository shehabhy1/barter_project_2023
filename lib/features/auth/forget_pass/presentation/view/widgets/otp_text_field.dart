import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../../../core/helper/app_constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../model_view/cubit/forget_pass_cubit.dart';

class OtpTextFieldWidget extends StatelessWidget {
  const OtpTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      fillColor: Colors.blue,
      numberOfFields: 6,
      fieldWidth: context.deviceWidth * .11,
      borderRadius: BorderRadius.circular(10),
      autoFocus: true,
      showFieldAsBox: true,
      onCodeChanged: (val) {},
      textStyle: AppStyles.semiBold20,
      focusedBorderColor: AppConstants.primaryColor,
      enabledBorderColor: AppConstants.greyColor,
      onSubmit: (String verificationCode) {
        context.read<ForgetPassCubit>().codeOtp = verificationCode;
        debugPrint(context.read<ForgetPassCubit>().codeOtp.toString());
      },
    );
  }
}
