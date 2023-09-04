
import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RadioCheckLanguage extends StatefulWidget {
  const RadioCheckLanguage({Key? key}) : super(key: key);

  @override
  State<RadioCheckLanguage> createState() => _RadioCheckState();
}

class _RadioCheckState extends State<RadioCheckLanguage> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              activeColor: kPrimaryColor,
              value: 1,
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
              'Arabic - AR',
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
              'English - EN - Translation',
              style: Styles.textStyle14,
            ),
          ],
        ),
      ],
    );
  }
}