import 'dart:io';

import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/cash_helper/cache_helper.dart';
import 'package:barter_app/core/helper/cash_helper/cash_helper_constants.dart';
import 'package:barter_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../pick_image_cubit/pick_image_cubit.dart';
import '../../pick_image_cubit/pick_image_states.dart';
import '../custom_cached_image.dart';
import 'icon_button_filled.dart';
import 'image_picker_dialog.dart';

class ImageProfile extends StatelessWidget {
  final bool isProfile;
  const ImageProfile({super.key, this.isProfile = false});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PickImageCubit>();
    return Center(
      child: BlocBuilder<PickImageCubit, PickImageStates>(
        builder: (context, state) {
          return Stack(
            children: [
              CircleAvatar(
                radius: 57.r,
                backgroundColor: AppColors.primaryColor,
                child: CircleAvatar(
                  radius: 55.r,
                  child: cubit.selectImage == null
                      ? isProfile == false
                          ? CircleAvatar(
                              radius: 68.r,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage:
                                  const AssetImage(Assets.imagesAvatar),
                            )
                          : CustomCachedNetworkImage(
                              radius: 320,
                              height: 150,
                              width: 150,
                              imageUrl: CashHelper.getData(
                                  key: CashConstants.userImage),
                            )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(320),
                          child: Image.file(
                            File(cubit.selectImage!.path),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: CustomIconFilled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ImagePickerDialog(
                          cameraFun: () => cubit.pickImage(false),
                          galleryFun: () => cubit.pickImage(true),
                          removeFun: () => cubit.removeImage(),
                          profilePic: cubit.selectImage,
                        );
                      },
                    );
                  },
                  icon: Icons.edit,
                ),
                // ),
              ),
            ],
          );
        },
      ),
    );
  }
}
