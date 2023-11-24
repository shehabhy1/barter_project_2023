import 'package:flutter/material.dart';

import 'cusomt_list_tile_profile.dart';
import 'custom_button_edit_profile.dart';
import 'image_profile_with_image.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: ListView(
        children: const [
          ImageProfileWithIcon(),
          Text(
            'Ali Arsany',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          CustomListTileProfile(
            title: 'Name',
            subTitle: 'Ali Arsany',
          ),
          CustomListTileProfile(
            title: 'Email',
            subTitle: 'ali@gmail.com',
          ),
          CustomListTileProfile(
            title: 'Password',
            subTitle: '**********',
          ),
          CustomListTileProfile(
            title: 'Phone Number',
            subTitle: '01022352587',
          ),
          CustomListTileProfile(
            title: 'Address',
            subTitle: 'Cairo, Nasr City',
          ),
          CustomButtonEditProfile(),
        ],
      ),
    );
  }
}
