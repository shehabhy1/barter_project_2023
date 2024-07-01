import 'dart:io';
import 'package:barter_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:barter_app/core/helper/extentions.dart';
import '../../../../../core/pick_image_cubit/pick_image_cubit.dart';
import '../../../../../core/pick_image_cubit/pick_image_states.dart';
import '../../../../../core/shared_widget/upload_image/icon_button_filled.dart';

class BuildImagePost extends StatelessWidget {
  final PickImageCubit cubit;
  const BuildImagePost({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickImageCubit, PickImageStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            cubit.pickImage(true);
          },
          child: Stack(
            children: [
              Container(
                height: context.deviceHeight * .35,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                child: cubit.selectImage == null
                    ? Image.asset(
                        Assets.addPost,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(cubit.selectImage!.path),
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
              ),
              if (cubit.selectImage != null)
                Positioned(
                  top: 1,
                  right: 1,
                  child: CustomIconFilled(
                    onPressed: () {
                      cubit.removeImage();
                    },
                    icon: Icons.delete_outline_rounded,
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
