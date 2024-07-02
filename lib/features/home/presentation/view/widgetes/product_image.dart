import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:flutter/material.dart';

class ProdcutImage extends StatelessWidget {
  const ProdcutImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.network(
          product.image!.url!,
          width: double.infinity,
        ),
      ),
    );
  }
}
