import 'package:barter_project_2023/features/notification/presentition/widgets/notification_item_list_view.dart';
import 'package:barter_project_2023/features/notification/presentition/widgets/top_part_of_notificationScreen.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = "NotificationsScreen";

  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopPartOfNotificationScreen(),
          const SizedBox(
            height: 15.0,
          ),
          NotificationItemListView(),
        ],
      ),
    );
  }
}
