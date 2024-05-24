import 'package:barter_app/features/edit_profile/widgets/image_picker/bottom_sheet_body.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'pick_image_widget.dart';

class ProfileImageDialoge extends StatefulWidget {
  final String imageUrl;

  const ProfileImageDialoge({super.key, required this.imageUrl});

  @override
  State<ProfileImageDialoge> createState() => ProfileImageDialogeState();
}

class ProfileImageDialogeState extends State<ProfileImageDialoge> {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetProfileCubit>();
    return GestureDetector(
      onTap: () {
        showImagePickerDialogSection(context, cubit);
      },
      child: PickImageWidget(
        pickedImage: cubit.profilePic,
        imageUrl: widget.imageUrl,
      ),
    );
  }

  void showImagePickerDialogSection(
      BuildContext context, GetProfileCubit cubit) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return BottomSheetBody(
          cameraFun: () async {
            cubit.profilePic =
                await picker.pickImage(source: ImageSource.camera);
            setState(() {});
          },
          galleryFun: () async {
            cubit.profilePic =
                await picker.pickImage(source: ImageSource.gallery);
            setState(() {});
          },
          removeFun: () {
            cubit.profilePic = null;
            Navigator.pop(context);
            setState(() {});
          },
        );
      },
    );
  }
}
