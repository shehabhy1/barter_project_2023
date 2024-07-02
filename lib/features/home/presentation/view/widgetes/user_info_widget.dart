import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:flutter/material.dart';

import 'package:barter_app/core/helper/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
