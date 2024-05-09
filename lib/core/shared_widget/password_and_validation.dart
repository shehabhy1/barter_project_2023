import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/view/widgets/password_validation.dart';
import '../helper/app_regex_helper.dart';
import '../helper/spacing.dart';
import 'app_text_field.dart';

class PasswordAndValidation extends StatefulWidget {
  const PasswordAndValidation({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  State<PasswordAndValidation> createState() => _PasswordAndValidationsState();
}

class _PasswordAndValidationsState extends State<PasswordAndValidation> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = widget.controller;
    setupPasswordControllerListener();
    super.initState();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    // passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFiled(
          controller: widget.controller,
          type: TextInputType.visiblePassword,
          hint: 'Write your password',
          isObscure: isObscureText,
          validate: (val) {
            if (val == null || val.isEmpty || val.length < 6 || val.length > 16
                //  || !AppRegex.isPasswordValid(val)
                ) {
              return "Please enter a valid password";
            }
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
        verticalSpace(24),
        PasswordValidations(
          hasLowerCase: hasLowercase,
          hasUpperCase: hasUppercase,
          hasSpecialCharacters: hasSpecialCharacters,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        )
      ],
    );
  }
}
