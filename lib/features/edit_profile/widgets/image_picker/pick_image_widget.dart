import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/shared_widget/custom_cached_image.dart';
import 'container_of_icon.dart';

class PickImageWidget extends StatelessWidget {
  final XFile? pickedImage;
  final String imageUrl;
  const PickImageWidget({super.key, this.pickedImage, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return pickedImage == null
        ? Stack(
            children: [
              CustomCachedNetworkImage(
                width: 150,
                height: 150,
                radius: 150,
                imageUrl: imageUrl,
                fit: BoxFit.fill,
              ),
              const Positioned(
                right: -1,
                bottom: -1,
                child: FilledIcon(icon: Icons.edit),
              ),
            ],
          )
        : Stack(
            children: [
              CircleAvatar(
                radius: 75.r,
                backgroundImage: FileImage(
                  File(
                    pickedImage!.path,
                  ),
                ),
              ),
              const Positioned(
                right: -1,
                bottom: -1,
                child: FilledIcon(icon: Icons.edit),
              ),
            ],
          );
  }
}
