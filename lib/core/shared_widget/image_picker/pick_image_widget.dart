import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../helper/app_constants.dart';

class PickImageWidget extends StatelessWidget {
  final XFile? pickedImage;

  const PickImageWidget({super.key, this.pickedImage});

  @override
  Widget build(BuildContext context) {
    return pickedImage == null
        ? CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const AssetImage("assets/images/avatar.png"),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppConstants.primaryColor.withOpacity(0.8),
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          )
        : CircleAvatar(
            backgroundImage: FileImage(
              File(
                pickedImage!.path,
                //fit: BoxFit.fill,
              ),
            ),
          );
  }
}
