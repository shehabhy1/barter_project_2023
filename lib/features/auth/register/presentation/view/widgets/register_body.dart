import 'package:barter_app/core/shared_widget/check_button.dart';
import 'package:barter_app/core/shared_widget/custom_loading_indicator.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/fields_of_register.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/register_bloc_listener.dart';
import 'package:barter_app/features/auth/register/presentation/view/widgets/create_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/app_buttom.dart';
import '../../../../../../core/shared_widget/image_picker/show_image_dialog.dart';
import '../../../../../../core/shared_widget/radio_buttom.dart';
import '../../../../login/presentation/view/widgets/custom_center_text.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const CustomCenterText(text: 'Create account'),
          const ImageDialogeShow(),
          const SizedBox(height: 20),
          const FieldsOfRegister(),
          const RadioCheck(),
          const SizedBox(height: 16),
          CheckButtom(
            text: 'Privacy & Policy',
            cubit: context.read<RegisterCubit>(),
          ),
          const SizedBox(height: 20),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return state is RegisterLoadingState
                  ? const CustomLoadingIndicator()
                  : AppButton(
                      text: 'Sign Up',
                      func: () {
                        context
                            .read<RegisterCubit>()
                            .validateThenDoLogin(context);
                      },
                    );
            },
          ),
          const SizedBox(height: 15),
          const LastLineSign(),
          const RegisterBlocListener(),
        ],
      )),
    );
  }
}
