import 'package:flutter/material.dart';
import '../../../core/shared_widget/warning_dialog.dart';
import '../../../core/utils/assets.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

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
                width: 50,
                height: 2.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'profile photo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    AssetData.deleteIcon,
                  ),
                  onTap: () {
                    AppWarning.logoutDialog(
                      context: context,
                      tittle: 'Do you want to remove photo?',
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.asset(
                          AssetData.galleryIcon,
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.asset(
                          AssetData.cameraIcon,
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Camera',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.asset(
                          AssetData.avatarIcon,
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Avatar',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
