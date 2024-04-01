import 'dart:io';

import 'package:barter_app/core/shared_widget/check_button.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/fields_of_register.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/register_bloc_listener.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/create_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/helper/app_constants.dart';
import '../../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../../core/utils/styles.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: SingleChildScrollView(
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Column(
              children: [
                const Center(
                  child: Text(
                    'Create account',
                    style: Styles.textStyle32,
                  ),
                ),
                SizedBox(
                  width: 130,
                  height: 130,
                  child: context.read<RegisterCubit>().profilePic == null
                      ? CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage:
                              const AssetImage("assets/images/avatar.png"),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: () async {},
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade400,
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery)
                                            .then((value) => context
                                                .read<RegisterCubit>()
                                                .uploadProfilePic(value!));
                                      },
                                      child: const Icon(
                                        Icons.camera_alt_sharp,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(
                              context.read<RegisterCubit>().profilePic!.path)),
                        ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     ImagePicker().pickImage(source: ImageSource.gallery).then(
                //         (value) => context
                //             .read<RegisterCubit>()
                //             .uploadProfilePic(value!));
                //   },
                //   child: Stack(
                //     alignment: Alignment.bottomRight,
                //     children: [
                //       CircleAvatar(
                //         radius: 80,
                //         backgroundImage:
                //             FileImage(File(cubit.profilePic!.path)),
                //         child: cubit.profilePic == null
                //             ? const Icon(
                //                 Icons.camera_alt,
                //                 size: 80,
                //               )
                //             : null,
                //       ),
                //       if (cubit.profilePic != null)
                //         IconButton(
                //             onPressed: () {
                //               cubit.removeImage();
                //             },
                //             icon: const Icon(
                //               Icons.delete_rounded,
                //               size: 30,
                //               color: Colors.blue,
                //             ))
                //     ],
                //   ),
                // ),
                if (cubit.profilePic == null)
                  const Padding(
                      padding: EdgeInsetsDirectional.only(top: 20),
                      child: Text('please select your image')),
                const SizedBox(
                  height: 20,
                ),
                const FieldsOfRegister(),
                const SizedBox(
                  height: 16,
                ),
                const CheckButtom(text: 'I accepted privacy & Policy '),
                const SizedBox(
                  height: 20,
                ),
                if (cubit.profilePic != null)
                  CustomButton(
                      width: double.infinity,
                      height: 60,
                      backgroundColor: AppConstants.primaryColor,
                      text: 'Sign Up',
                      func: () {
                        validateThenDoLogin(context);
                      }),
                const SizedBox(
                  height: 15,
                ),
                const LastLineSign(),
                const RegisterBlocListener()
              ],
            );
          },
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterStates(
          email: context.read<RegisterCubit>().emailController.text,
          password: context.read<RegisterCubit>().passwordController.text,
          //TODO: handle user gender
          gender: 'male',
          // gender: context.read<RegisterCubit>().selectedValue == 1
          //     ? 'male'
          //     : 'femal',
          firstName: context.read<RegisterCubit>().fNameController.text,
          lastName: context.read<RegisterCubit>().lNameController.text,
          phone: context.read<RegisterCubit>().phoneController.text);
    }
  }
}
