import 'package:flutter/material.dart';

import 'widgets/settings_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Settings',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const SettingsBody(),
    );
  }
}
