import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/email_and_password.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/login_bloc_listener.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/second_row.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/app_buttom.dart';
import 'custom_center_text.dart';
import 'dont_have_account.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        verticalSpace(40),
        const CustomCenterText(text: 'Login'),
        verticalSpace(20),
        const LoginForm(),
        verticalSpace(10),
        const SecondRow(),
        verticalSpace(20),
        AppButton(
          text: 'Log in',
          onPressed: () => context.read<LoginCubit>().validateThenDoLogin(),
        ),
        const SizedBox(height: 15),
        const DontHaveAccount(),
        const LoginBlocListener(),
      ],
    );
  }
}
