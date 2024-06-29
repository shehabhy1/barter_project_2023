import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/communication_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
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
              _buildProductImage(context),
              verticalSpace(20),
              _buildSellerInfo(),
              verticalSpace(15),
              _buildProductDescription(),
              const Spacer(),
              const BuildCommunicationButtons(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/img_1.png',
        width: double.infinity,
        height: context.deviceHeight * 0.2,
      ),
    );
  }

  Widget _buildSellerInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?w=130&h=195&c=7&r=0&o=5&pid=1.7',
            ),
          ),
          horizontalSpace(16),
          Text(
            'Mohmaed Gehad',
            style: AppStyles.medium18,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription() {
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
            'A power bank is a portable device designed to recharge your electronic devices on the go. It serves as an external battery pack that can store electrical energy to charge various gadgets like smartphones, tablets, laptops, and other USB-powered devices when access to a standard power outlet is unavailable.',
            style: AppStyles.regularGrey16
                .copyWith(color: Colors.black.withOpacity(.7)),
          ),
        ],
      ),
    );
  }
}
