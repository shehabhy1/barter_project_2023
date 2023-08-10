import 'package:flutter/material.dart';

import 'settings_tile.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsTile(
              title: "Language",
              icon: Icons.arrow_forward_ios_outlined,
            ),
            SettingsTile(
              title: "About",
              icon: Icons.arrow_forward_ios_outlined,
            ),
            SettingsTile(
              title: "Rating & feedback",
            ),
            SettingsTile(
              title: "Help",
            ),
            SettingsTile(
              title: "Version",
              subTitle: Text(
                'v.1.7.2',
                style: TextStyle(
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
