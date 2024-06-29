import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import 'settings_list_tile.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SettingsListTile(
            tittle: 'Language',
            icon: true,
            //onTap: () => ,
          ),
          const SettingsListTile(tittle: 'Rating & feedback'),
          const SettingsListTile(tittle: 'Help'),
          SettingsListTile(
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
