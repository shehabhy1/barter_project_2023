import 'package:barter_project_2023/features/notification/presentition/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationItemListView extends StatelessWidget {
  const NotificationItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: check list isEmpty or not to show another screen
    return Expanded(
      child: ListView.builder(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const NotificationItem();
          }),
    );
  }
}
