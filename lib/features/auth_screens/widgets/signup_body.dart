import 'package:barter_project_2023/core/shared_widget/check_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../../core/shared_widget/default_text.dart';
import '../../../../../../core/shared_widget/radio_buttom.dart';
import '../../../../../../core/shared_widget/show_snack_bar.dart';
import '../../../../../../core/utils/styles.dart';
import '../../layout/presentation/views/layout.dart';
import '../log_in/view_model/auth_cubit.dart';
import 'another_acount.dart';
import 'create_line.dart';
import 'item_widget.dart';

// validator not working methods like (.contain)
class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible  = false;
  //final String genderSelected;

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
          padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 20.w),
          child: SingleChildScrollView(
            // explain why we need this absorbPointer
            child: AbsorbPointer(
              absorbing: state is AuthLoading ? true : false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Create account',
                      style: Styles.textStyle32,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Text(
                    'First Name',
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 8.h),
                  defaultTextField(
                    controller: fNameController,
                    type: TextInputType.text,
                    hint: 'Write your First Name',
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    'Last Name',
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 8.h),
                  defaultTextField(
                    controller: lNameController,
                    type: TextInputType.text,
                    hint: 'Write your Last Name',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Email',
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 8.h),
                  defaultTextField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    hint: 'Write your Email',
                    validate: (value) {
                      if (value!.isEmpty || value!.contains('@')) {
                        return 'Email is Wrong You must write .com';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  const RadioCheck(),
                  const Text(
                    'Password',
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 8.h),
                  defaultTextField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    hint: 'Write your password',
                    suffix: isVisible ? Icons.visibility : Icons.visibility_off,
                    pressed: (){
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    validate: (val) {
                      if (val.isEmpty || val.length < 6 || val.length > 16) {
                        return 'Password should contain at least 1 special character,the length should be \n between 6 to 16  character';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 8.h),
                  const CheckButton(text: 'I accepted privacy & Policy '),
                  SizedBox(height: 20.h),
                  CustomButton(
                    width: double.infinity,
                    height: 60,
                    backgroundColor: kPrimaryColor,
                    isLoading: state is AuthLoading ? true : false,
                    text: 'Sign Up',
                    func: () {
                      AuthCubit.get(context).registerUser(
                        fName: fNameController.text,
                        lName: lNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                  SizedBox(height: 15.h),
                  const AnotherAccount(),
                  const ItemWidget(),
                  const LastLineSign(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
