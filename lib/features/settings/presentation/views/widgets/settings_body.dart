import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:barter_project_2023/features/settings/presentation/views/about_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'settings_tile.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsTile(
            onTap: () {
              context.pushNamed(AppRouter.kLanguageView);
            },
            title: "Language",
            icon: Icons.arrow_forward_ios_outlined,
          ),
          SettingsTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutView()));
            },
            title: "About",
            icon: Icons.arrow_forward_ios_outlined,
          ),
          SettingsTile(
            onTap: () {},
            title: "Rating & feedback",
          ),
          SettingsTile(
            onTap: () {},
            title: "Help",
          ),
          SettingsTile(
            onTap: () {},
            title: "Version",
            subTitle: const Text(
              'v.1.7.2',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
