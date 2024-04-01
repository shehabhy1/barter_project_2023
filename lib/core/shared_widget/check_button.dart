import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/styles.dart';

class CheckButtom extends StatefulWidget {
  final String text;
  const CheckButtom({Key? key, required this.text}) : super(key: key);

  @override
  State<CheckButtom> createState() => _CheckButtomState();
}

class _CheckButtomState extends State<CheckButtom> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  5.0), // Set your desired border radius here
            ),
            value: isChecked,
            activeColor: Constants.primaryColor,
            onChanged: (newBool) {
              setState(() {
                isChecked = newBool!;
              });
            }),
        Text(
          widget.text,
          style: Styles.textStyle20.copyWith(
            fontSize: 14,
            color: const Color(0xFF8B8B8B),
          ),
        ),
      ],
    );
  }
}
