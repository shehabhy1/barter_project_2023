import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/features/log_in/presentation/view_model/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';

class RadioCheck extends StatefulWidget {
  const RadioCheck({Key? key}) : super(key: key);

  @override
  State<RadioCheck> createState() => _RadioCheckState();
}

class _RadioCheckState extends State<RadioCheck> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: Styles.textStyle20,
        ),
        Row(
          children: [
            Radio(
              activeColor: kPrimaryColor,
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                  AuthCubit.get(context).gender = 'Male';
                });
              },
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Male',
              style: Styles.textStyle14,
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Radio(
              activeColor: kPrimaryColor,
              value: 2,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                  AuthCubit.get(context).gender = 'Female';
                });
              },
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Female',
              style: Styles.textStyle14,
            ),
          ],
        ),
      ],
    );
  }
}
