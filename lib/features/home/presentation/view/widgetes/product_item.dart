import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:flutter/material.dart';

import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/helper/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  product.image!.url!,
                  width: double.infinity,
                  // height: context.deviceHeight * 0.12,
                ),
              ),
            ),
            verticalSpace(20),
            Row(
              children: [
                CircleAvatar(
                  radius: 15.sp,
                  backgroundImage: NetworkImage(
                    product.user!.image!.url!,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(product.user!.name!,
                            style: AppStyles.medium16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        product.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.regularGrey14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  context.pushNamed(Routes.productDetailsView,
                      arguments: product);
                },
                child: Text(
                  'Discover',
                  style: AppStyles.regularGrey14.copyWith(color: Colors.white),
                ),
              ),
            ),
            verticalSpace(5),
          ],
        ),
      ),
    );
  }
}
