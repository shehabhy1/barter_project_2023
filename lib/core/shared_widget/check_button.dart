import 'package:barter_project_2023/core/helper/cache_helper.dart';
import 'package:barter_project_2023/features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class CheckButton extends StatefulWidget {
  final String text;
  const CheckButton({Key? key, required this.text}) : super(key: key);

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 600 ? 12.0 : 14.0; // Adjust as needed

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              value: isChecked,
              activeColor: kPrimaryColor,
              onChanged: (newBool) {
                setState(() {
                  isChecked = newBool!;
                  isChecked ? saveUserToken(cubit.userToken.toString()) : null;
                });
              },
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: fontSize,
                color: const Color(0xFF8B8B8B),
              ),
            ),
          ],
        );
      },
    );
  }

  void saveUserToken(String value) {
    CacheHelper.saveString(key: Constant.kUserToken, value: value);
  }
}
