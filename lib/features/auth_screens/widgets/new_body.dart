import 'package:barter_project_2023/features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../../core/shared_widget/default_text.dart';
import '../../../../../../core/utils/styles.dart';
import '../../layout/presentation/views/layout.dart';

class NewPassBody extends StatelessWidget {
  const NewPassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newPassController = TextEditingController();
    var rePassController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context,state){},
        builder: (context,state){
          return Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'New password',
                          style: Styles.textStyle32,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'New Password',
                        style: Styles.textStyle20,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      defaultTextField(
                        type: TextInputType.visiblePassword,
                        hint: 'Write your password',
                        controller: newPassController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'New Password most not empty';
                          } else {
                            return null;
                          }
                        },
                        suffix: AuthCubit.get(context).isNewPasswordShow? Icons.visibility:Icons.visibility_off,
                        pressed:()
                        {
                          AuthCubit.get(context).NewPasswordShowed();
                        },
                        isObscure: AuthCubit.get(context).isNewPasswordShow,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Repeat Password',
                        style: Styles.textStyle20,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      defaultTextField(
                          type: TextInputType.visiblePassword,
                          hint: 'Write your password',
                          controller: rePassController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Repeat Password most not empty';
                            } else {
                              return null;
                            }
                          },
                        suffix: AuthCubit.get(context).isRepeatPasswordShow? Icons.visibility:Icons.visibility_off,
                        pressed:()
                        {
                          AuthCubit.get(context).RepeatPasswordShowed();
                        },
                        isObscure: AuthCubit.get(context).isRepeatPasswordShow,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          width: double.infinity,
                          height: 60,
                          backgroundColor: kPrimaryColor,
                          text: 'Send',
                          func: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LayoutView()),
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
