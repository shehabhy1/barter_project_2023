import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';

class CheckButtom extends StatefulWidget {
  final String text;
  const CheckButtom({super.key, required this.text});

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
              5.0,
            ), // Set your desired border radius here
          ),
          value: isChecked,
          activeColor: AppConstants.primaryColor,
          onChanged: (newBool) {
            setState(() {
              isChecked = newBool!;
            });
          },
        ),
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
