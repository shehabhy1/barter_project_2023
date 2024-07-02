import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsAppBar extends AppBar {
  final ProductModel product;

  ProductDetailsAppBar({
    super.key,
    required this.product,
  });

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        product.title!,
        style: AppStyles.medium24,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.report_gmailerrorred_outlined),
        ),
      ],
    );
  }
}
