/* // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barter_project_2023/core/utils/styles.dart';
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
        title: Text('Edit Profile'),
        titleTextStyle: Styles.textStyle24,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: EditProfileBody(),
    );
  }
}
 */