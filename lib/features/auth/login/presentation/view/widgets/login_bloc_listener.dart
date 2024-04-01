import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/shared_widget/defaut_circular_progress.dart';
import 'package:barter_app/core/shared_widget/error_dialog.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        if (state is LoginErrorState) {
          // setupErrorState(context, state.error);
          snackBarState(context, state.error);
        } else if (state is LoginSuccessState) {
          // context.pop();
          context.pushNamed(Routes.layoutView);
        }
      },
      child: const SizedBox(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(error,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black,
            )),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'close',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
