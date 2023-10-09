import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.textColor, required this.backgroundColor, required this.text,
  });

  final Color textColor;
  final Color backgroundColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.pop(context);
      },
      style:  ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              backgroundColor
          ),
          side: const MaterialStatePropertyAll(
              BorderSide(width: 0.5,color: Constant.primaryColor)
          ),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                  horizontal: 30,vertical: 10
              )
          )
      ), child: Text(
      text,
      style: Styles.textStyle14.copyWith(
          color: textColor
      ),
    ),);
  }
}