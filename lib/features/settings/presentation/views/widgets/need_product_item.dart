import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:barter_project_2023/features/add%20post/data/model/specific_post_model.dart';
import 'package:barter_project_2023/features/auth_screens/model/user_model.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class NeedProductItem extends StatelessWidget {
  final PostModel product;
  final UserModel userModel;
  const NeedProductItem(
      {Key? key, required this.product, required this.userModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductItem(
        fName: userModel.fName,
        lName: userModel.lName,
        disc: product.disc,
        //TODO: add product image
        productImage: product.pic!,
        //TODO: add profile image
        profilImage: 'assets/images/profile_img.png');
  }
}
