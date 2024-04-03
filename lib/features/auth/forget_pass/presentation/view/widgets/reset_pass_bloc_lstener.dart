import 'package:barter_app/core/shared_widget/warning_dialog.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helper/app_constants.dart';

class ResetPassBlocListener extends StatelessWidget {
  const ResetPassBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPassCubit, ForgetPassState>(
      listenWhen: (previous, current) =>
          current is ResetPasswordSuccessState ||
          current is ResetPasswordSuccessState ||
          current is ResetPasswordErrorState,
      listener: (context, state) {
        if (state is ResetPasswordErrorState) {
          AppWarning.dialogErrorState(
            context,
            state.error,
          );
        } else if (state is ResetPasswordSuccessState) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              backgroundColor: AppConstants.primaryColor,
              content: Text(
                'Password changed successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
              ),
            ),
          );
          context.pushReplacementNamed(Routes.loginView);
        } else {
          //TODO: add progress

          // defaultCircularProgress(context: context);
        }
      },
      child: Container(),
    );
  }
}
