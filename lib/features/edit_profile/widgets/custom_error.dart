import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customErrorWidget(BuildContext context, String error) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: AppStyles.regularGrey16,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: AppStyles.medium24
                .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
