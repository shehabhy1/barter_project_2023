import 'dart:developer';

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
  final whatsAppController = TextEditingController();
  final passwordController = TextEditingController();
  //final selectedImage = '';
  //final String genderSelected;
  // this method is working only when i press on hot reload
  // someone who using bloc may change this
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
                  GestureDetector(
                    onTap: () => AuthCubit.get(context).selectImage(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 60,
                        backgroundImage:
                            AuthCubit.get(context).imageFile != null
                                ? FileImage(AuthCubit.get(context).imageFile!)
                                : null,
                        child: AuthCubit.get(context).imageFile == null
                            ? const Icon(
                                Icons.camera_alt,
                                size: 80,
                              )
                            : null,
                      ),
                    ),
                  ),
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
                  const Text(
                    'whatsapp number',
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 8.h),

                  defaultTextField(
                    controller: whatsAppController,
                    type: TextInputType.phone,
                    maxLength: 11,
                    hint: 'Write your WhatsApp Number',
                    validate: (value) {
                      if (value!.isEmpty || value!.contains('@')) {
                        return 'Enter Your WhatsApp Number';
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
                    suffix: AuthCubit.get(context).isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    pressed: () {
                      AuthCubit.get(context).passwordShowed();
                    },
                    isObscure: AuthCubit.get(context).isPasswordShow,
                    validate: (val) {
                      if (val.isEmpty || val.length < 6 || val.length > 16) {
                        return 'Password should contain at least 1 special character,the length should be \n between 6 to 16  character';
                      }
                      return null;
                    },
                  ),
                  /* 
                   here we have removed the confirm password section
                   SizedBox(height: 16.h),
                  const Text(
                    'Confirm Password',
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 8.h),
                  defaultTextField(
                    type: TextInputType.visiblePassword,
                    hint: 'Confirm  your password',
                  ), */
                  SizedBox(height: 8.h),
                  //TODO: privacy and policy => change color to purble
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          log('are you okay?');
                        });
                      },
                      // TODO: here we will use rich text
                      child: const CheckButton(
                          text: 'I accepted privacy & Policy ')),
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
                        whatsapp: whatsAppController.text,
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
