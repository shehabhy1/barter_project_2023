import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.fName,
      required this.lName,
      required this.disc,
      required this.productImage,
      required this.profilImage});

  final String fName;
  final String lName;
  final String disc;
  final String profilImage;
  final String productImage;

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
                child: Image(
                  image: NetworkImage(productImage),
                  width: 170.w,
                  fit: BoxFit.cover,
                  // height: 100.h,
                  height: 120.h,
                )),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  //TODO change asset image to network image
                  backgroundImage: AssetImage(
                    profilImage,
                  ),
                  radius: 18,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$fName ' '$lName',
                          style: Styles.textStyle14
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          disc,
                          style: Styles.textStyle12.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: const Color.fromARGB(255, 71, 35, 35),
                              fontSize: 12),
                        ),
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
