import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import 'sitting_list_tile.dart';

class SittingViewBody extends StatelessWidget {
  const SittingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SittingListTile(
          tittle: 'Language',
          icon: true,
          //onTap: () => ,
        ),
        SittingListTile(tittle: 'Rating & feedback'),
        SittingListTile(tittle: 'Help'),
        SittingListTile(
          tittle: 'Version',
          subTittle: Text(
            'v1.7.2',
            style: AppStyles.regularGrey16,
          ),
        ),
      ]),
    );
  }
}
