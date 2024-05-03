import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/spacing.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumber,
      required this.hasMinLength});
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  buildValidationRow(String text, bool hasValidated) => Row(
        children: [
          CircleAvatar(
            radius: 2.5.sp,
            backgroundColor: Colors.grey,
          ),
          horizontalSpace(10),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              color: hasValidated ? Colors.grey : Colors.black,
              decorationThickness: 2,
            ),
          )
        ],
      );
}
