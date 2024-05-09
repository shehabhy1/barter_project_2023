import 'package:barter_app/features/auth/login/presentation/view/widgets/email_and_password.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/login_bloc_listener.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/second_row.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/app_buttom.dart';
import '../../../../../../core/shared_widget/custom_loading_indicator.dart';
import 'custom_center_text.dart';
import 'last_row.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCenterText(text: 'Login'),
            const SizedBox(height: 20),
            const LoginForm(),
            const SizedBox(height: 8),
            const SecondRow(),
            const SizedBox(height: 20),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return state is LoginLoadingState
                    ? const CustomLoadingIndicator()
                    : AppButton(
                        text: 'Log in',
                        onPressed: () {
                          context.read<LoginCubit>().validateThenDoLogin();
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
}
