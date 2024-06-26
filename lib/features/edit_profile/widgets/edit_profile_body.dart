import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_buttom.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:barter_app/features/profile_screen/data/models/user_info_model.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cusomt_list_tile_profile.dart';
import 'image_picker/show_image_dialog.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({
    super.key,
    required this.userData,
  });
  final UserData userData;

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController  _nameController =TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _whatsController = TextEditingController();
  @override
  // void setState(VoidCallback fn) {
  //   _nameController.text = widget.userData.name!;
  //   _phoneController.text = widget.userData.phone!;
  //   _whatsController.text = widget.userData.whatsapp!;
  //   super.setState(fn);
  // }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetProfileCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (cubit.state is GetUserinfoLoadingState)
                const LinearProgressIndicator(),
              verticalSpace(15),
              ProfileImageDialoge(
                imageUrl: widget.userData.image!.url!,
              ),
              verticalSpace(5),
              Text(
                '${widget.userData.name}',
                textAlign: TextAlign.center,
                style: AppStyles.medium24.copyWith(fontWeight: FontWeight.w400),
              ),
              verticalSpace(20),
              CustomListTileProfile(
                title: 'Name',
                subTitle: '${widget.userData.name}',
                controller: _nameController,
              ),
             
              CustomListTileProfile(
                title: 'Phone Number',
                subTitle: '${widget.userData.phone}',
                controller: _phoneController,
              ),
              CustomListTileProfile(
                title: 'WhatsApp Number',
                subTitle: '${widget.userData.whatsapp}',
                controller: _whatsController,
              ),
              verticalSpace(50),
              AppButton(
                text: 'Saved Changes',
                onPressed: () {
                  cubit.updateUserInfo(
                    name: _nameController.text,
                    phone: _phoneController.text,
                    whatsapp: _whatsController.text,
                  );
                  // cubit.whatsController.text.isEmpty
                  //     ? debugPrint('Null')
                  //     : debugPrint(cubit.whatsController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _whatsController.dispose();
  }
}
