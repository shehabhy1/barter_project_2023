import 'package:barter_project_2023/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class RadioCheck extends StatelessWidget {
  RadioCheck(
      {super.key,
      this.groupValue,
      this.onChanged,
      required this.value,
      this.text = ''});
  Object? groupValue;
  void Function(Object?)? onChanged;
  Object value;
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              activeColor: kPrimaryColor,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: Styles.textStyle14,
            ),
          ],
        ),
      ],
    );
  }
}
/* class RadioCheck extends StatefulWidget {
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
              value: 'male',
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
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
 */