import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/assets.dart';
import '../custom_icon.dart';

class BottomSheetBody extends StatelessWidget {
  final Function() cameraFun;
  final Function() galleryFun;
  final Function() removeFun;
  const BottomSheetBody({
    super.key,
    required this.cameraFun,
    required this.galleryFun,
    required this.removeFun,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            Center(
              child: Container(
                width: 100,
                height: 2.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'profile photo',
                    style: AppStyles.medium18,
                  ),
                  InkWell(
                    onTap: removeFun,
                    child: Image.asset(
                      AssetData.deleteIcon,
                      scale: 0.9,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45),
            Row(
              children: [
                TextPicture(
                  text: 'Gallery',
                  icon: AssetData.galleryIcon,
                  onTap: () {
                    galleryFun();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
                TextPicture(
                  text: 'Camera',
                  icon: AssetData.cameraIcon,
                  onTap: () {
                    cameraFun();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
                TextPicture(
                  text: 'Avatar',
                  icon: AssetData.avatarIcon,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
