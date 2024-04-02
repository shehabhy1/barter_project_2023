import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'image_picker_dialog.dart';
import 'pick_image_widget.dart';

class ImageDialogeShow extends StatefulWidget {
  const ImageDialogeShow({super.key});

  @override
  State<ImageDialogeShow> createState() => ImageDialogeShowState();
}

class ImageDialogeShowState extends State<ImageDialogeShow> {
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return GestureDetector(
      onTap: () {
        showImagePickerDialogSection(context, cubit);
      },
      child: PickImageWidget(
        pickedImage: cubit.profilePic,
      ),
    );
  }

  void showImagePickerDialogSection(BuildContext context, RegisterCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImagePickerDialog(
          profilePic: cubit.profilePic,
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
            setState(() {});
          },
        );
      },
    );
  }
}
