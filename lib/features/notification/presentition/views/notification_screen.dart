import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:barter_project_2023/features/notification/presentition/widgets/notification_item.dart';
import 'package:barter_project_2023/features/notification/presentition/widgets/notification_item_list_view.dart';
import 'package:barter_project_2023/features/notification/presentition/widgets/top_part_of_notificationScreen.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  static const String routeName = "NotificationsScreen";

  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TopPartOfNotificationScreen(),
          SizedBox(
            height: 15.0,
          ),
          NotificationItemListView(),
        ],
      ),
    );
  }
}
