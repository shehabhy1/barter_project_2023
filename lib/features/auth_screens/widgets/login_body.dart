import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../../core/shared_widget/default_text.dart';
import '../../../../../../core/shared_widget/show_snack_bar.dart';
import '../../../../../../core/utils/styles.dart';
import '../../layout/presentation/views/layout.dart';
import '../log_in/view_model/auth_cubit.dart';
import 'another_acount.dart';
import 'item_widget.dart';
import 'last_row.dart';
import 'second_row.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, messege: state.errMessage);
        } else if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LayoutView(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: SingleChildScrollView(
            child: AbsorbPointer(
              absorbing: state is AuthLoading ? true : false,
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
                  const Text(
                    'Email',
                    style: Styles.textStyle20,
                  ),
                  const SizedBox(height: 8),
                  defaultTextField(
                    type: TextInputType.emailAddress,
                    hint: 'Write your Email',
                    controller: emailController,
                    validate: (value) {
                      if (value!.isEmpty || value!.contains('@')) {
                        return 'Email is Wrong You must write .com';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Password',
                    style: Styles.textStyle20,
                  ),
                  const SizedBox(height: 8),
                  defaultTextField(
                    type: TextInputType.visiblePassword,
                    hint: 'Write your password',
                    controller: passwordController,
                    validate: (val) {
                      if (val.isEmpty || val.length < 6 || val.length > 16) {
                        return 'Password should contain at least 1 special character,the length should be \n between 6 to 16  character';
                      }
                      return null;
                    },
                    suffix: AuthCubit.get(context).isPasswordShow? Icons.visibility:Icons.visibility_off,
                    pressed:()
                    {
                      AuthCubit.get(context).PasswordShowed();
                    },
                    isObscure: AuthCubit.get(context).isPasswordShow,

                  ),
                  const SizedBox(height: 8),
                  const SecondRow(),
                  const SizedBox(height: 20),
                  CustomButton(
                    width: double.infinity,
                    height: 60,
                    backgroundColor: kPrimaryColor,
                    text: 'Log in',
                    isLoading: state is AuthLoading ? true : false,
                    func: () {
                      AuthCubit.get(context).loginUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  const AnotherAccount(),
                  const ItemWidget(),
                  const LastLine(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
