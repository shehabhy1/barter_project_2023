// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barter_project_2023/constants.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Widget? subTitle;
  final void Function()? onTap;
  const SettingsTile({
    Key? key,
    this.icon,
    required this.title,
    this.subTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Constant.primaryColor,
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0.25,
        child: ListTile(
          minVerticalPadding: 15,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: subTitle,
          trailing: Icon(
            icon,
            size: 22,
          ),
        ),
      ),
    );
  }
}
