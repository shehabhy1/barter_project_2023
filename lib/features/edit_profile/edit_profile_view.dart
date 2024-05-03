import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';

import '../../core/shared_widget/build_app_bar.dart';
import 'widgets/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(title: "Edit Profile", onPressed: () => context.pop()),
      body: const EditProfileBody(),
    );
  }
}
