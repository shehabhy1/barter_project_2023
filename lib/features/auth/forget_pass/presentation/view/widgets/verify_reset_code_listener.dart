import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/shared_widget/warning_dialog.dart';
import '../../model_view/cubit/forget_pass_cubit.dart';
import '../../model_view/cubit/forget_pass_state.dart';

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
          AppWarning.dialogErrorState(
            context,
            state.error,
          );
        } else if (state is VerifyResetCodeSuccessState) {
          context.pushReplacementNamed(Routes.resetPassView, arguments: email);
        }
        // else {
        //   const Center(child: CircularProgressIndicator());
        // }
      },
      child: const SizedBox.shrink(),
    );
  }
}
