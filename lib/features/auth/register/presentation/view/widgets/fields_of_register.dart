import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'whats_and_password_text_field_part.dart';
import 'signup_text_field_part.dart';

class FieldsOfRegister extends StatelessWidget {
  const FieldsOfRegister({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is RegisterLoadingState ? true : false,
          child: Form(
            key: cubit.formKey,
            autovalidateMode: cubit.autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignUpTextFieldPart(cubit: cubit),
                const SizedBox(height: 8),
                PhoneAnsPasswordTextFieldPart(cubit: cubit),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
