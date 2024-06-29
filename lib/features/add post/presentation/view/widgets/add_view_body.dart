import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_drop_list.dart';

class AddViewBody extends StatelessWidget {
  const AddViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              //TODO: remove this app bar and edit image

              // const CustomPostOptionsAppBar(),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: context.deviceHeight * .377,
                  width: context.deviceWidth * .86,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/add_post_icon.png",
                      height: 76.h,
                      width: 89.w,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomDropList(),
            ],
          ),
        ),
      ],
    );
  }
}
