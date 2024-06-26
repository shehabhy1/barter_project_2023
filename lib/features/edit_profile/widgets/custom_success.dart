import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

void customSuccessWidget(
    BuildContext context, String message, String nav, Function() onPresses) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 32,
      ),
      content: Text(
        message,
        style: AppStyles.regularGrey16,
      ),
      actions: [
        TextButton(
          onPressed: onPresses,
          child: Text(
            nav,
            style: AppStyles.font16SemiBoldBlack,
          ),
        ),
      ],
    ),
  );
}
