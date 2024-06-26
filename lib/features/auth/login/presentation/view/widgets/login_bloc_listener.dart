import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/shared_widget/custom_loading.dart';
import 'package:barter_app/core/shared_widget/warning_dialog.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginSuccessState ||
          current is LoginErrorState,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          customLoading(context);
        } else if (state is LoginErrorState) {
          // setupErrorState(context, state.error);
          context.pop();
          AppWarning.snackBarState(context, state.error);
        } else if (state is LoginSuccessState) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.layoutView,
              predicate: (route) => false);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
