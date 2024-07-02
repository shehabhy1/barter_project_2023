import 'package:barter_app/core/shared_widget/check_button.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/signup_form.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/register_bloc_listener.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/pick_image_cubit/pick_image_cubit.dart';
import '../../../../../../core/shared_widget/app_buttom.dart';
import '../../../../../../core/shared_widget/upload_image/image_of_profile.dart';
import '../../../../../../core/shared_widget/radio_buttom.dart';
import '../../../../login/presentation/view/widgets/custom_center_text.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const CustomCenterText(text: 'Create account'),
        const ImageProfile(),
        const SizedBox(height: 20),
        const SignUpForm(),
        RadioCheck(
          registerCubit: cubit,
          text: 'Gender',
          tittleOne: 'Male',
          tittleTwo: 'Female',
        ),
        const SizedBox(height: 16),
        CheckButtom(
          text: 'Privacy & Policy',
          cubit: cubit,
        ),
        const SizedBox(height: 20),
        AppButton(
          text: 'Sign Up',
          onPressed: () {
            cubit.validateThenDoLogin(
              context,
              profilePic: context.read<PickImageCubit>().selectImage,
            );
          },
        ),
        const SizedBox(height: 15),
        const HaveAccount(),
        const RegisterBlocListener(),
        const SizedBox(height: 15),
      ],
    );
  }
}
