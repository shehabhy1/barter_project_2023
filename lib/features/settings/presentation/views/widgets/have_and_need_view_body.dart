import 'package:barter_project_2023/core/shared_widget/default_text.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAndNeddViewBody extends StatelessWidget {
  const HaveAndNeddViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 44.h,
            child: defaultText(
              type: TextInputType.text,
              onChange: (value) {},
              hint: 'Search',
              prefix: Icons.search,
            ),
          ),
          SizedBox(height: 10.h),
          Text('My Have', style: Styles.textStyle20.copyWith(fontSize: 20.sp)),
          const SizedBox(height: 15),
          SizedBox(
            height: 160.h,
            child: ListView.builder(
              itemBuilder: (context, index) => const ProductItem(
                  productSrc: 'assets/images/unsplash_kvmdsTrGOBM.png',
                  profileSrc: 'assets/images/profile_img.png',
                  name: 'Mohamed Gehad',
                  desc: 'Description'),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
            ),
          ),
          SizedBox(height: 10.h),
          Text('My Needs', style: Styles.textStyle20.copyWith(fontSize: 20.sp)),
          const SizedBox(height: 15),
          SizedBox(
            height: 160.h,
            child: ListView.builder(
              itemBuilder: (context, index) => const ProductItem(
                  productSrc: 'assets/images/unsplash_kvmdsTrGOBM.png',
                  profileSrc: 'assets/images/profile_img.png',
                  name: 'Mohamed Gehad',
                  desc: 'Description'),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
