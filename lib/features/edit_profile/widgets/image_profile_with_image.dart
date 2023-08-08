import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/assets.dart';

class ImageProfileWithIcon extends StatelessWidget {
  const ImageProfileWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            AssetData.testImageEditProfile,
            height: MediaQuery.of(context).size.height * .16,
            width: MediaQuery.of(context).size.height * .16,
          ),
          Positioned(
            top: 70,
            left: 80,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .055,
              width: MediaQuery.of(context).size.height * .055,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AssetData.camera,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
