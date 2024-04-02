import 'package:barter_app/core/shared_widget/check_button.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/fields_of_register.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/register_bloc_listener.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/create_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/app_buttom.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../login/presentation/view/widgets/custom_center_text.dart';
import 'image_section.dart';

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
                const CustomCenterText(text: 'Create account'),
                const ImageSection(),
                if (cubit.profilePic == null)
                  const Padding(
                      padding: EdgeInsetsDirectional.only(top: 20),
                      child: Text(
                        'please select your image',
                        style: Styles.textStyle14,
                      )),
                const SizedBox(height: 20),
                const FieldsOfRegister(),
                const SizedBox(height: 16),
                const CheckButtom(text: 'I accepted privacy & Policy '),
                const SizedBox(height: 20),
                if (cubit.profilePic != null)
                  AppButton(
                      text: 'Sign Up',
                      func: () {
                        cubit.validateThenDoLogin();
                      }),
                const SizedBox(height: 15),
                const LastLineSign(),
                const RegisterBlocListener(),
              ],
            );
          },
        ),
      ),
    );
  }
}

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