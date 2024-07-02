import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/bargainer_info.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/communication_buttons.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/product_description.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/product_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductDetailsAppBar(product: product),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(context, product.image!.url!),
              verticalSpace(20),
              BargainerInfo(user: product.user!),
              verticalSpace(15),
              ProductDescription(description: product.description!),
              const Spacer(),
              BuildCommunicationButtons(
                phoneNumber: product.user!.phone!,
                urlImage: product.image!.url!,
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context, String imageUrl) {
    return Center(
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: context.deviceHeight * 0.2,
      ),
    );
  }
}
