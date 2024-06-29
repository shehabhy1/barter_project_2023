import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import '../../../core/shared_widget/build_app_bar.dart';
import 'widget/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Sittings", onPressed: () => context.pop()),
      body: const SettingsViewBody(),
    );
  }
}
