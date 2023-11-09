import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/styles.dart';

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
  }
}
