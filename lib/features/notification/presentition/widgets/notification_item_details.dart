import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:flutter/material.dart';

class NotificationItemDetails extends StatelessWidget {
  const NotificationItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 28.0,
              backgroundImage: AssetImage(AssetData.notiPhoto),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Lorem ipsum dolor sit amet\n'
              'consectetur adipiscing elit, sed\n'
              'diam nonummy \n'
              ' nibh euismod',
              style: TextStyle(fontSize: 15.0, color: Color(0xFF929090)),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text('10:00 PM'),
          ),
        ),
      ],
    );
  }
}
