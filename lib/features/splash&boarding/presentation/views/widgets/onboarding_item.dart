import 'package:flutter/material.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../data/models/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final bool isLast;
  final OnBoardingModel model;
  const OnBoardingItem({
    super.key,
    required this.isLast,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          model.image!,
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: isLast
              ? const SizedBox.shrink()
              : Text(
                  model.description!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8B8B8B),
                  ),
                ),
        ),
        verticalSpace(15),
      ],
    );
  }
}
