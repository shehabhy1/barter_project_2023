import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import 'sitting_list_tile.dart';

class SittingViewBody extends StatelessWidget {
  const SittingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SittingListTile(
            tittle: 'Language',
            icon: true,
            //onTap: () => ,
          ),
          const SittingListTile(tittle: 'Rating & feedback'),
          const SittingListTile(tittle: 'Help'),
          SittingListTile(
            tittle: 'Version',
            subTittle: Text(
              'v1.7.2',
              style: AppStyles.regularGrey16,
            ),
          ),
        ]),
      ),
    );
  }
}
