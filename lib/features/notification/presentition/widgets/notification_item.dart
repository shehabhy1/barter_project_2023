import 'package:barter_project_2023/features/notification/presentition/widgets/notification_item_details.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: replace fixed size to adaptive size => sizer package
    return Padding(
      padding: EdgeInsets.only(
        right: 5.w,
        left: 5.w,
        bottom: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: 110.0,
        width: double.infinity,
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10, right: 10),
          child: NotificationItemDetails(),
        ),
      ),
    );
  }
}
