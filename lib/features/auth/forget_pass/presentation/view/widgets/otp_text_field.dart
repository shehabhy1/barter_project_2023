import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../../../../core/helper/app_constants.dart';
import '../../../../../../core/shared_widget/warning_dialog.dart';
import '../../model_view/cubit/forget_pass_cubit.dart';

class OtpTextFieldWidget extends StatelessWidget {
  final ForgetPassCubit cubit;
  const OtpTextFieldWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.verifyKey,
      child: Pinput(
          // key: cubit.verifyKey,
          length: 6,
          autofocus: true,
          validator: (val) {
            if (val == null || val.isEmpty || val.length < 6) {
              AppWarning.snackBarState(context, "Please enter a valid code");
            }
            return null;
          },
          onCompleted: (value) {
            context.read<ForgetPassCubit>().codeOtp = value;
          },
          focusedPinTheme: PinTheme(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(12),
              //color: AppColors.primaryColor,
            ),
          )),
    );
    // return OtpTextField(
    //   fillColor: Colors.blue,
    //   numberOfFields: 6,
    //   fieldWidth: context.deviceWidth * .11,
    //   borderRadius: BorderRadius.circular(10),
    //   autoFocus: true,
    //   showFieldAsBox: true,
    //   onCodeChanged: (val) {},
    //   textStyle: AppStyles.semiBold20,
    //   focusedBorderColor: AppColors.primaryColor,
    //   enabledBorderColor: AppColors.greyColor,
    //   onSubmit: (String verificationCode) {
    //     context.read<ForgetPassCubit>().codeOtp = verificationCode;
    //     debugPrint(context.read<ForgetPassCubit>().codeOtp.toString());
    //   },
    // );
  }
}
