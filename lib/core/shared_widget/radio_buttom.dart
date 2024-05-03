import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import '../utils/styles.dart';

class RadioCheck extends StatefulWidget {
  const RadioCheck({super.key});

  @override
  State<RadioCheck> createState() => _RadioCheckState();
}

class _RadioCheckState extends State<RadioCheck> {
  int _selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Gender',
          style: AppStyles.semiBold20,
        ),
        Row(
          children: [
            Radio(
              activeColor: AppConstants.primaryColor,
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                  context.read<RegisterCubit>().gender = 'Male';
                });
              },
            ),
            const SizedBox(
              width: 5,
            ),
             Text(
              'Male',
              style: AppStyles.regularGrey16,
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Radio(
              activeColor: AppConstants.primaryColor,
              value: 2,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                  context.read<RegisterCubit>().gender = 'Female';
                });
              },
            ),
            const SizedBox(
              width: 5,
            ),
             Text(
              'Female',
              style: AppStyles.regularGrey16,
            ),
          ],
        ),
      ],
    );
  }
}
