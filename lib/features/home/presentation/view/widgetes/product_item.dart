import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/discover_button.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/product_image.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/user_info_widget.dart';
import 'package:flutter/material.dart';

import 'package:barter_app/core/helper/spacing.dart';

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
            ProdcutImage(product: product),
            verticalSpace(20),
            UserInfoWidget(product: product),
            verticalSpace(10),
            DiscoverButton(product: product),
            verticalSpace(5),
          ],
        ),
      ),
    );
  }
}

