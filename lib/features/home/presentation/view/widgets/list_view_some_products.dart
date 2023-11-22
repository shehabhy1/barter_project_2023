import 'package:barter_project_2023/core/shared_widget/componets.dart';
import 'package:barter_project_2023/features/add%20post/data/model/product_model.dart';
import 'package:barter_project_2023/features/home/presentation/view/product_details.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'package:barter_project_2023/app_img/assets.dart';

class ListViewSomeProducts extends StatelessWidget {
  final List<ProductModel> products;
  const ListViewSomeProducts({
    super.key,
    required this.products,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.37,
      child: ListView.separated(
          // physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                navigateTo(context, ProductDetails(product: products[index]));
              },
              child: itemBuilder(
                context,
                products[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: products.length),
      // products.length but we need with pagination
    );
  }

  Container itemBuilder(BuildContext context, ProductModel proudct) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.39,
      padding: const EdgeInsets.only(bottom: 3),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListView(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.network(
                proudct.pic!,
                fit: BoxFit.cover,
                // Assets.imagesImg,
              ),
            ),

            // const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(proudct.userName,
                  style: Styles.textStyle14.copyWith(color: Colors.black)),
              subtitle: Text(proudct.disc,
                  style: Styles.textStyle12
                      .copyWith(overflow: TextOverflow.ellipsis)),
              leading: Image.asset(
                Assets.imagesProfileImg,
                width: 28,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 80,
                height: 40,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: Constant.primaryColor),
                child: TextButton(
                    onPressed: () {
                      navigateTo(context, ProductDetails(product: proudct));
                    },
                    child: Text('Discover',
                        style:
                            Styles.textStyle14.copyWith(color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
