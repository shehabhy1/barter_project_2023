import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:barter_project_2023/features/auth_screens/model/user_model.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HaveProductItem extends StatelessWidget {
  final PostModel product;
  final UserModel userModel;
  const HaveProductItem(
      {Key? key, required this.product, required this.userModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductItem(
        fName: userModel.fName,
        lName: userModel.lName,
        disc: product.disc,
        productImage: product.pic!,
        //TODO: add profile iamge
        profilImage: 'assets/images/profile_img.png');
  }
}
