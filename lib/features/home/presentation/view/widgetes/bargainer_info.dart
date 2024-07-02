import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:flutter/material.dart';

class BargainerInfo extends StatelessWidget {
  const BargainerInfo({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
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
}
