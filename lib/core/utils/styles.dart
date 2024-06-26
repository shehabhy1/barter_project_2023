import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static final bold32 = TextStyle(
    fontSize: 31.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    letterSpacing: -0.48,
  );
  static final medium24 = TextStyle(
    color: const Color(0xFF171717),
    fontSize: 23.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static final semiBold20 = TextStyle(
    fontSize: 19.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static final medium18 = TextStyle(
    fontSize: 17.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  static final medium16 = TextStyle(
    color: const Color(0xFF171717),
    fontSize: 15.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02,
  );
  static final regularGrey16 = TextStyle(
    color: const Color(0xFF767474),
    fontSize: 15.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );

  static final regularGrey12 = TextStyle(
    color: const Color(0xFF746F6F),
    fontSize: 11.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.05,
  );
  static final regularBlack16 = TextStyle(
    color: const Color(0xFF50453A),
    fontSize: 15.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
  static TextStyle font16SemiBoldBlack = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: Colors.black,
  );
}
