import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/communication_buttons.dart';
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
      appBar: AppBar(
        title: Text(
          product.title!,
          style: AppStyles.medium24,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.report_gmailerrorred_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(context, product.image!.url!),
              verticalSpace(20),
              _buildBargainerInfo(product.user!),
              verticalSpace(15),
              _buildProductDescription(product.description!),
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

  Widget _buildBargainerInfo(User user) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              user.image!.url!,
            ),
          ),
          horizontalSpace(16),
          Text(
            user.name!,
            style: AppStyles.medium18,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription(String description) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: AppStyles.medium18,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.description!,
            style: AppStyles.regularGrey16
                .copyWith(color: Colors.black.withOpacity(.7)),
          ),
        ],
      ),
    );
  }
}
