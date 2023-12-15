import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/sub_title_rating.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ListTileOfReviews extends StatelessWidget {
  const ListTileOfReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Ahmed Mohamed ',
              style: Styles.textStyle14.copyWith(color: Colors.black)),
          trailing: const Text('20 product', style: Styles.textStyle14),
          // subtitle: const SubTitleRating(),
          leading: Image.asset(
            AssetData.imagesImg,
            width: 54,
          ),
        ),
      ),
    );
  }
}
