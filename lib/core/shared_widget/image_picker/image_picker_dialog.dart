import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: Colors.white,
      elevation: 0,
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
            icon: const Icon(
              Icons.camera_alt,
              color: AppConstants.primaryColor,
              size: 25,
            ),
            label: Text(
              "Camera",
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              galleryFun();
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(
              Icons.image,
              color: AppConstants.primaryColor,
              size: 25,
            ),
            label: Text(
              "Gallery",
              style: TextStyle(fontSize: 14.sp),
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
              icon: const Icon(
                Icons.remove,
                color: AppConstants.primaryColor,
                size: 25,
              ),
              label: Text(
                "Remove",
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
        ],
      ),
    );
  }
}
