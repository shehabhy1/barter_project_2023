import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AllTap extends StatelessWidget {
  const AllTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AssetData.emptyImage,
          // fit: BoxFit.cover,
        ),
        const Text(
          'You don\'t have any deals ' ,
          style: TextStyle(
            fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
