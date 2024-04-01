import 'package:barter_app/core/helper/app_regex_helper.dart';
import 'package:barter_app/features/auth/login/presentation/view/widgets/password_validation.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/shared_widget/default_text.dart';
import '../../../../../../core/utils/styles.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 8,
          ),
          defaultText(
            type: TextInputType.emailAddress,
            hint: 'Write your Email',
            controller: context.read<LoginCubit>().emailController,
            validate: (value) {
              //value.tostring to activate the isEmpty method
              if (value!.isEmpty ||
                  value == null ||
                  value == AppRegex.isEmailValid(value)) {
                return 'Email is Wrong You must write .com';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Password',
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 8,
          ),
          defaultText(
            controller: context.read<LoginCubit>().passwordController,
            type: TextInputType.visiblePassword,
            hint: 'Write your password',
            isObscure: isObscureText,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
            sufficIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          PasswordValidations(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength)
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }
}
