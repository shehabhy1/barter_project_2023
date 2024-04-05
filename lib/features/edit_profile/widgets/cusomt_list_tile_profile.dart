import 'package:flutter/material.dart';
import 'edit_profile_list_tile.dart';
import 'edit_profile_text_field.dart';

class CustomListTileProfile extends StatefulWidget {
  final String title;
  final String subTitle;
  final Widget? trailing;
  final TextEditingController? controller;

  const CustomListTileProfile({
    super.key,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.controller,
  });

  @override
  State<CustomListTileProfile> createState() => _CustomListTileProfileState();
}

class _CustomListTileProfileState extends State<CustomListTileProfile> {
  final FocusNode searchFocusNode = FocusNode();
  bool searchOpened = false;

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return searchOpened
        ? EditProfileTextField(
            searchFocusNode: searchFocusNode,
            widget: widget,
            onPressed: () => state(),
            //onSubmitted: (p0) => state(),
          )
        : EditProfileListTile(
            widget: widget,
            onTap: () {
              state();
              if (searchOpened) {
                Future.delayed(const Duration(milliseconds: 25), () {
                  FocusScope.of(context).requestFocus(searchFocusNode);
                });
              } else {
                searchFocusNode.unfocus();
              }
            },
          );
  }

  void state() {
    setState(() {
      searchOpened = !searchOpened;
    });
  }
}
