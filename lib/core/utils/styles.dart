import 'package:flutter/material.dart';

abstract class AppStyles {
  static const bold32 = TextStyle(
    fontSize: 32,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    letterSpacing: -0.48,
  );
  static const medium24 = TextStyle(
    color: Color(0xFF171717),
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const semiBold20 = TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const medium18 = TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  static const medium16 = TextStyle(
    color: Color(0xFF171717),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02,
  );
  static const regularGrey16 = TextStyle(
    color: Color(0xFF767474),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );

  static const regularGrey12 = TextStyle(
    color: Color(0xFF746F6F),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.05,
  );
  static const regularBlack16 = TextStyle(
    color: Color(0xFF50453A),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
}
