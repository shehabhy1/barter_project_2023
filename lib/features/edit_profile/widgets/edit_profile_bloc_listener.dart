import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routing/routes.dart';
import '../../../core/shared_widget/custom_loading.dart';
import '../view_model/update_user_cubit/update_user_cubit.dart';
import '../view_model/update_user_cubit/update_user_state.dart';
import 'custom_error.dart';
import 'custom_success.dart';

class EditProfileBlocListener extends StatelessWidget {
  const EditProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserCubit, UpdateUserStatus>(
      listenWhen: (previous, current) =>
          current is EditUserLoadingState ||
          current is EditUserSuccessState ||
          current is EditUserErrorState,
      listener: (context, state) {
        if (state is EditUserLoadingState) {
          customLoading(context);
        } else if (state is EditUserSuccessState) {
          context.pop();
          customSuccessWidget(context, state.message, "Go To Home", () {
            context.pushNamedAndRemoveUntil(
              Routes.layoutView,
              predicate: (route) => false,
            );
          });
        } else if (state is EditUserErrorState) {
          customErrorWidget(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
