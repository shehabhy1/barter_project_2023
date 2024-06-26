import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../helper/app_constants.dart';

customLoading(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: SpinKitWaveSpinner(
        waveColor: AppColors.primaryColor,
        trackColor: AppColors.primaryColor,
        color: AppColors.white,
        size: 70.h,
      ),
    ),
  );
}
