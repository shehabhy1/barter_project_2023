import 'package:barter_project_2023/features/notification/presentition/widgets/notification_item_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class NotificationItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 15.0 , left: 15.0,right: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 110.0,
        width: double.infinity,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0 , left: 10 , right: 10),
          child: NotificationItemDetails(),
        ),
      ),
    );

  }
}
