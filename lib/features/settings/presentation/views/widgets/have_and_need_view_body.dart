import 'package:barter_project_2023/core/shared_widget/default_text.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:barter_project_2023/features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'package:barter_project_2023/features/auth_screens/model/user_model.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAndNeddViewBody extends StatelessWidget {
  final List<PostModel> posts;
  final UserModel user;
  const HaveAndNeddViewBody(
      {super.key, required this.posts, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 44.h,
              child: defaultTextField(
                type: TextInputType.text,
                onChange: (value) {},
                hint: 'Search',
                prefix: Icons.search,
              ),
            ),
            SizedBox(height: 10.h),
            Text('My Have', style: Styles.textStyle20.copyWith(fontSize: 20)),
            const SizedBox(height: 15),
            //TODO: handle loading state
            Builder(builder: (context) {
              if (State is GetUserDataLoading) {
                return const CircleAvatar();
              } else {
                return SizedBox(
                  height: 160.h,
                  child: myHaveList(posts, user),
                );
              }
            }),
            SizedBox(height: 10.h),
            Text('My Needs', style: Styles.textStyle20.copyWith(fontSize: 20)),
            // const SizedBox(height: 15),
            // SizedBox(
            //   height: 160.h,
            //   child: ListView.builder(
            //     itemBuilder: (context, index) => const ProductItem(
            //        postModel: [],userModel: ,),
            //     itemCount: 5,
            //     scrollDirection: Axis.horizontal,
            //     physics: const BouncingScrollPhysics(),
            //   ),
            // ),
          ],
        ));
  }

  ListView myHaveList(List<PostModel> posts, UserModel user) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          ProductItem(postModel: posts[index], userModel: user),
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
    );
  }
}
