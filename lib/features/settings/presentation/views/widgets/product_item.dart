import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productSrc,
    required this.profileSrc,
    required this.name,
    required this.desc,
  }) : super(key: key);

  final String productSrc;
  final String profileSrc;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        // width: 170.h,
        // height: 180.w,
        height: context.deviceHeight / 2.8,

        width: context.deviceWidth / 2.1,

        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                productSrc,
                width: 170.w,
                fit: BoxFit.cover,
                height: 100.h,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    profileSrc,
                  ),
                  radius: 18,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Styles.textStyle14
                          .copyWith(color: Colors.black, fontSize: 14.sp),
                    ),
                    Text(
                      desc,
                      style: Styles.textStyle12
                          .copyWith(color: Colors.black, fontSize: 12.sp),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
