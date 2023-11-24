import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: const AssetImage(
                'assets/images/unsplash_bzqU01v-G54.png',
              ),
              fit: BoxFit.cover,
              height: 204.h,
              width: 382.w,
            ),
          ),
          SizedBox(height: 40.h),
          Text('Our purpose',
              style: Styles.textStyle24.copyWith(fontSize: 22)),
          SizedBox(height: 24.h),
          Text(
            'Every home has a lot of things that you don’t know where you put , so this app for sharing anything .\nIt helps exchange your items as electronics, clothing  with other in your local community .\n \nThe app facilitates communication and negotiation between users. Learn more',
            style: Styles.textStyle14.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
