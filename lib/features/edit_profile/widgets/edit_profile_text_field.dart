import 'package:flutter/material.dart';
import '../../../core/shared_widget/app_text_field.dart';
import 'cusomt_list_tile_profile.dart';

class EditProfileTextField extends StatelessWidget {
  final FocusNode searchFocusNode;
  final CustomListTileProfile widget;
  final void Function()? onPressed;
  final void Function(String?)? onSubmitted;
  const EditProfileTextField({
    super.key,
    required this.searchFocusNode,
    required this.widget,
    this.onPressed,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFiled(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      focusNode: searchFocusNode,
      type: TextInputType.name,
      controller: widget.controller,
      label: widget.title,
      sufficIcon: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.close),
      ),
      onSubmitted: onSubmitted,
      //prefixIcon: Text('data'),
    );
  }
}
