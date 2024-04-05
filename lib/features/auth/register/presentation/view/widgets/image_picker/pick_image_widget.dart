import 'dart:io';
import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'container_of_icon.dart';

class PickImageWidget extends StatelessWidget {
  final XFile? pickedImage;
  const PickImageWidget({super.key, this.pickedImage});

  @override
  Widget build(BuildContext context) {
    return pickedImage == null
        ? Stack(
            children: [
              CircleAvatar(
                radius: 70.r,
                backgroundColor: AppConstants.primaryColor,
                child: CircleAvatar(
                  radius: 68.r,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: const AssetImage("assets/images/avatar.png"),
                ),
              ),
              const Positioned(
                right: -1,
                bottom: -1,
                child: ContainerIcon(icon: Icons.camera_alt_sharp),
              ),
            ],
          )
        : Stack(
            children: [
              CircleAvatar(
                radius: 75.r,
                backgroundColor: AppConstants.primaryColor,
                child: CircleAvatar(
                  radius: 72.r,
                  backgroundImage: FileImage(
                    File(
                      pickedImage!.path,
                    ),
                  ),
                ),
              ),
              const Positioned(
                right: -1,
                bottom: -1,
                child: ContainerIcon(icon: Icons.edit),
              ),
            ],
          );
  }
}
