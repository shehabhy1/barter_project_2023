import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model_view/cubit/forget_pass_cubit.dart';
import '../../model_view/cubit/forget_pass_state.dart';

class LinearProgressIndicatorBuilder extends StatelessWidget {
  const LinearProgressIndicatorBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPassCubit, ForgetPassState>(
      builder: (context, state) {
        if (state is ForgetPassLoadingState) {
          return const LinearProgressIndicator(
            color: AppColors.primaryColor,
          );
        } else if (state is VerifyResetCodeLoadingState) {
          return const LinearProgressIndicator(
            color: AppColors.primaryColor,
          );
        } else if (state is ResetPasswordLoadingState) {
          return const LinearProgressIndicator(
            color: AppColors.primaryColor,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
