import 'package:barter_project_2023/core/shared_widget/componets.dart';
import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:barter_project_2023/features/home/presentation/view/view_all_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class RowTextViewAll extends StatelessWidget {
  final List<PostModel> posts;
  const RowTextViewAll({super.key, required this.text, required this.posts});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Styles.textStyle20),
        TextButton(
          onPressed: () {
            navigateTo(
              context,
              ViewAllScreen(posts: posts),
            );
            // context.pushNamed(AppRouter.kHomeAllView);
          },
          child: Text('View all',
              style: Styles.textStyle14.copyWith(color: Constant.primaryColor)),
        ),
      ],
    );
  }
}
