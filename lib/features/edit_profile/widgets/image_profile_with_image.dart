import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import 'bottom_sheet_body.dart';

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
            left: 90,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .055,
              width: MediaQuery.of(context).size.height * .055,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppConstants.primaryColor,
              ),
              child: IconButton(
                onPressed: ()
                {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context)
                  {
                    return const BottomSheetBody();
                  });
                },
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
