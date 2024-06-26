import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../helper/app_constants.dart';

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
          IconWithButton(
            label: "Camera",
            function: cameraFun,
            icon: Icons.camera_alt,
          ),
          IconWithButton(
            label: " Gallery ",
            function: galleryFun,
            icon: Icons.image,
          ),
          if (profilePic != null)
            IconWithButton(
              label: "Remove",
              function: removeFun!,
              icon: Icons.delete,
            ),
        ],
      ),
    );
  }
}

class IconWithButton extends StatelessWidget {
  final String label;
  final Function function;
  final IconData icon;
  const IconWithButton({
    super.key,
    required this.function,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        function();
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      icon: Icon(icon, color: AppColors.primaryColor, size: 25),
      label: Text(
        label,
        style: TextStyle(fontSize: 14.sp, color: AppColors.greyColor),
      ),
    );
  }
}
