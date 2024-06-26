import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/shared_widget/warning_dialog.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared_widget/custom_loading.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoadingState ||
          current is RegisterSuccessState ||
          current is RegisterErrorState,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          customLoading(context);
        } else if (state is RegisterErrorState) {
          context.pop();
          AppWarning.snackBarState(context, state.error);
        } else if (state is RegisterSuccessState) {
          context.pop();
          context.pushNamedAndRemoveUntil(
            Routes.layoutView,
            predicate: (route) => false,
          );
        }
      },
      child: const SizedBox(),
    );
  }
}
