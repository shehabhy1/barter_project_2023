import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'widgets/settings_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          iconSize: 30,
        ),
        title: const Text('Settings', style: Styles.textStyle24),
        centerTitle: true,
      ),
      body: const SettingsBody(),
    );
  }
}
