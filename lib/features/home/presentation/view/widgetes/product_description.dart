import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
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
            description,
            style: AppStyles.regularGrey16
                .copyWith(color: Colors.black.withOpacity(.7)),
          ),
        ],
      ),
    );
  }
}
