import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'widgets/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Edit Profile'),
        titleTextStyle: AppStyles.medium24,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: const EditProfileBody(),
    );
  }
}
