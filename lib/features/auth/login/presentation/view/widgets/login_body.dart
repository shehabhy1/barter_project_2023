import 'package:barter_app/features/auth/login/presentation/view/widgets/email_and_password.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/login_bloc_listener.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/second_row.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/app_buttom.dart';
import '../../../../../../core/utils/styles.dart';
import 'last_row.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Login',
                style: Styles.textStyle32,
              ),
            ),
            const SizedBox(height: 20),
            const EmailAndPassword(),
            const SizedBox(height: 8),
            const SecondRow(),
            const SizedBox(height: 20),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return state is LoginLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : AppButton(
                        text: 'Log in',
                        func: () {
                          validateThenDoLogin(context);
                        },
                      );
              },
            ),
            const SizedBox(height: 15),
            const LastLine(),
            const LoginBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          );
    }
  }
}
