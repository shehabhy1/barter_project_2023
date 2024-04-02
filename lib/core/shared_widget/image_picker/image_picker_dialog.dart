import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  final Function cameraFun;
  final Function galleryFun;
  final Function? removeFun;
  final XFile? profilePic;

  const ImagePickerDialog({
    super.key,
    required this.cameraFun,
    required this.galleryFun,
    this.removeFun,
    this.profilePic,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: AppConstants.primaryColor.withOpacity(0.5),
      title: const Center(
        child: Text("Choose Option"),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
            onPressed: () {
              cameraFun();
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text(
              "Camera",
              style: TextStyle(fontSize: 15),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              galleryFun();
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.image),
            label: const Text(
              "Gallery",
              style: TextStyle(fontSize: 15),
            ),
          ),
          if (profilePic != null)
            TextButton.icon(
              onPressed: () {
                removeFun!();
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.remove),
              label: const Text(
                "Remove",
                style: TextStyle(fontSize: 15),
              ),
            ),
        ],
      ),
    );
  }
}
