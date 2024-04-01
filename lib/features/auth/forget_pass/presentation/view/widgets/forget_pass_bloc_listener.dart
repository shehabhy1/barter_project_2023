import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/shared_widget/error_dialog.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_cubit.dart';
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassBlocListener extends StatelessWidget {
  const ForgetPassBlocListener({super.key, required this.email});
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPassCubit, ForgetPassState>(
      listenWhen: (previous, current) =>
          current is ForgetPassErrorState ||
          current is ForgetPassSuccessState ||
          current is ForgetPassErrorState,
      listener: (context, state) {
        if (state is ForgetPassErrorState) {
          snackBarState(context, state.error);
        } else if (state is ForgetPassSuccessState) {
          context.pop();

          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('success'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Reset code sent successfully to your email address'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    disabledForegroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    context.pushReplacementNamed(Routes.verifyView,
                        arguments: email
                        // ?? context.read<ForgetPassCubit>().email
                        );
                    debugPrint('/////email=>>${email.text
                        // ??context.read<ForgetPassCubit>().email
                        }');
                  },
                  child: const Text('Continue'),
                ),
              ],
            ),
          );
        } else {
          //TODO: add progress
          // defaultCircularProgress(context: context);
        }
        // state.whenOrNull(
        //   forgetPasswordErrorState: (error) => snackBarState(context, error),
        //   forgetPasswordSuccessState: (data) {
        //     context.pop();

        //     showDialog(
        //       context: context,
        //       builder: (BuildContext context) => AlertDialog(
        //         title: const Text('success'),
        //         content: const SingleChildScrollView(
        //           child: ListBody(
        //             children: <Widget>[
        //               Text(
        //                   'Reset code sent successfully to your email address'),
        //             ],
        //           ),
        //         ),
        //         actions: <Widget>[
        //           TextButton(
        //             style: TextButton.styleFrom(
        //               foregroundColor: Colors.white,
        //               backgroundColor: Colors.blue,
        //               disabledForegroundColor: Colors.grey,
        //             ),
        //             onPressed: () {
        //               context.pushReplacementNamed(Routes.verifyView,
        //                   arguments: email
        //                   // ?? context.read<ForgetPassCubit>().email
        //                   );
        //               debugPrint('/////email=>>${email.text
        //                   // ??context.read<ForgetPassCubit>().email
        //                   }');
        //             },
        //             child: const Text('Continue'),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        //   forgetPasswordLoadinState: () =>
        //       defaultCircularProgress(context: context),
        // );
      },
      child: Container(),
    );
  }
}
