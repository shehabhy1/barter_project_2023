import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void setupErrorState(BuildContext context, String error) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       duration: const Duration(seconds: 3),
//       backgroundColor: Constants.primaryColor,
//       content: Text(
//         error,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 15.sp,
//           color: Colors.black,
//         ),
//       ),
//     ),
//   );
// }

void snackBarState(BuildContext context, String error) {
  // context.pop();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: AppConstants.primaryColor,
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.sp,
          color: Colors.black,
        ),
      ),
    ),
  );
}

void dialogErrorState(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(error,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.black,
          )),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'close',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    ),
  );
}
