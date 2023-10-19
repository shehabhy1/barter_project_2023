import 'package:barter_project_2023/core/shared_widget/componets.dart';
import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:barter_project_2023/features/auth_screens/model/user_model.dart';
import 'package:barter_project_2023/features/home/presentation/view/product_details.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'package:barter_project_2023/app_img/assets.dart';

class ListViewSomeProducts extends StatelessWidget {
  // final List<PostModel> posts;
  const ListViewSomeProducts({
    super.key,
    // required this.posts,
  });
  @override
  Widget build(BuildContext context) {
    final List<PostModel> posts = [
      PostModel(
          userId: '',
          name: 'mohamed Gehad',
          category: 'category',
          subCategory: 'subCategory',
          disc: 'disc',
          pic: 'pic'),
      PostModel(
          userId: '',
          name: 'mohamed Gehad',
          category: 'category',
          subCategory: 'subCategory',
          disc: 'disc',
          pic: 'pic'),
      PostModel(
          userId: '',
          name: 'mohamed Gehad',
          category: 'category',
          subCategory: 'subCategory',
          disc: 'disc',
          pic: 'pic'),
    ];
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.37,
      child: ListView.separated(
          // physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                navigateTo(context, ProductDetails(postModel: posts[index]));
              },
              child: itemBuilder(
                context,
                posts[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: 3),
    );
  }

  Container itemBuilder(BuildContext context, PostModel postModel) {
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
            Image.asset(
              Assets.imagesImg,
              width: 128,
            ),
            // const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('User name',
                  style: Styles.textStyle14.copyWith(color: Colors.black)),
              subtitle: Text(postModel.disc,
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
                height: 30,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    color: Constant.primaryColor),
                child: TextButton(
                    onPressed: () {
                      navigateTo(context, ProductDetails(postModel: postModel));
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
