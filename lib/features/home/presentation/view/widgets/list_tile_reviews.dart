// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:barter_project_2023/app_img/assets.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/sub_title_rating.dart';

import '../../../../../core/utils/styles.dart';

class ListTileOfReviews extends StatelessWidget {
  final String userName;
  const ListTileOfReviews({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(userName,
            style: Styles.textStyle14.copyWith(color: Colors.black)),
        trailing: const Text('20 product', style: Styles.textStyle14),
        subtitle: const SubTitleRating(),
        leading: Image.asset(
          Assets.imagesImg,
          width: 54,
        ),
      ),
    );
  }
}
