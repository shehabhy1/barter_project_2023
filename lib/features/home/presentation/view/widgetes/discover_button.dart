import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:flutter/material.dart';

import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';

class DiscoverButton extends StatelessWidget {
  const DiscoverButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          context.pushNamed(Routes.productDetailsView, arguments: product);
        },
        child: Text(
          'Discover',
          style: AppStyles.regularGrey14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
