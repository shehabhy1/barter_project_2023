import 'package:barter_project_2023/core/shared_widget/default_text.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/assets.dart';

class CustomListTileProfile extends StatefulWidget {
  final String title;
  final Widget? trailing;
  final TextEditingController controller;
  const CustomListTileProfile(
      {Key? key,
      required this.title,
      // required this.subTitle,
      this.trailing,
      required this.controller})
      : super(key: key);

  @override
  State<CustomListTileProfile> createState() => _CustomListTileProfileState();
}

class _CustomListTileProfileState extends State<CustomListTileProfile> {
  bool _isEditingText = false;
  String? text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
      subtitle: _isEditingText
          ? defaultTextField(
              enable: _isEditingText ? true : false,
              autofocus: true,
              type: TextInputType.text,
              controller: widget.controller,
              border: const UnderlineInputBorder(),
              // hint: widget.subTitle,
              // hint: text,
              onChange: (val) {
                text = val;
              },
              onFieldSubmitted: (val) {
                setState(() {
                  _isEditingText = !_isEditingText;
                });
              })
          : Text(
              widget.controller.text,
              style: const TextStyle(
                fontSize: 16,
                color: kGreyColor,
              ),
            ),
      trailing: InkWell(
        onTap: () {
          setState(() {
            _isEditingText = !_isEditingText;
          });
        },
        child: _isEditingText
            ? const SizedBox()
            : Image.asset(
                AssetData.editTextIcon,
                width: 25,
                height: 44,
                color: kGreyColor,
              ),
      ),
    );
  }
}





// class CustomListTileProfile extends StatelessWidget {
//   final String title;
//   final String subTitle;
//   final Widget? trailing;
//   const CustomListTileProfile({
//     Key? key,
//     required this.title,
//     required this.subTitle,
//     this.trailing,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: kPrimaryColor,
//         ),
//       ),
//       subtitle: Text(
//         subTitle,
//         style: const TextStyle(
//           fontSize: 16,
//           color: kGreyColor,
//         ),
//       ),
//       trailing: Image.asset(
//         AssetData.editTextIcon,
//         width: 25,
//         height: 44,
//         color: kGreyColor,
//       ),
//     );
//   }
// }
