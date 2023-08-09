// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Widget? subTitle;
  final VoidCallback? onTap;
  const SettingsTile({
    Key? key,
    this.icon,
    required this.title,
    this.subTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Icon(icon)),
          ],
        ),
        subTitle ?? const SizedBox(),
        Divider(
          color: Colors.grey[300],
          height: 15,
        ),
      ],
    );
  }
}
