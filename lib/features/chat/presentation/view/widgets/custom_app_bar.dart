import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBarBody() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xffD9D9D9),
        height: 1,
      ),
    ),
    title: Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            '',
          ),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name', // Replace with user's name
              style: TextStyle(fontSize: 15.sp, color: const Color(0xff838283)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'online now',
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff4CD964),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
