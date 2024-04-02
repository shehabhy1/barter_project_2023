import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/shared_widget/error_dialog.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoadingState ||
          current is RegisterSuccessState ||
          current is RegisterErrorState,
      listener: (context, state) {
        if (state is RegisterErrorState) {
          snackBarState(context, state.error);
        } else if (state is RegisterSuccessState) {
          context.pop();
          context.pushNamed(Routes.layoutView);
        }
      },
      child: const SizedBox(),
    );
  }

//   void setupErrorState(BuildContext context, String error) {
//     context.pop();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         icon: const Icon(
//           Icons.error,
//           color: Colors.red,
//           size: 32,
//         ),
//         content: Text(error,
//             style: TextStyle(
//               fontSize: 15.sp,
//               color: Colors.black,
//             )),
//         actions: [
//           TextButton(
//             onPressed: () {
//               context.pop();
//             },
//             child: Text(
//               'close',
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}
