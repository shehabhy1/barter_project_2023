import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/helper/app_constants.dart';
import '../../veiw_model/cubit/register_cubit.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,
      height: 130.h,
      child: context.read<RegisterCubit>().profilePic == null
          ? CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              backgroundImage: const AssetImage("assets/images/avatar.png"),
              child: Stack(
                children: [
                  Positioned(
                    right: -1,
                    bottom: -1,
                    child: GestureDetector(
                      onTap: () async {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppConstants.primaryColor.withOpacity(0.8),
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) => context
                                    .read<RegisterCubit>()
                                    .uploadProfilePic(value!));
                          },
                          child: const Icon(
                            Icons.camera_alt_sharp,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : CircleAvatar(
              backgroundImage: FileImage(
                File(context.read<RegisterCubit>().profilePic!.path),
              ),
            ),
    );
  }
}
