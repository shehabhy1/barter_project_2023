import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/assets.dart';

class CustomListTileProfile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? trailing;
  const CustomListTileProfile({
    Key? key,
    required this.title,
    required this.subTitle,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(
            fontSize: 16,
            color: kGreyColor,
          ),
        ),
        trailing: trailing);
  }
}
