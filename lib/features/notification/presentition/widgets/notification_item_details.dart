import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:barter_project_2023/features/notification/presentition/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class NotificationItemDetails extends StatelessWidget {
  const NotificationItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,

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
        // Flexible(
        //   child: Text(
        //     'Lorem ipsum dolor sit amet\n'
        //     'consectetur adipiscing elit, sed\n'
        //     'diam nonummy \n'
        //     ' nibh euismod',
        //     style: TextStyle(fontSize: 15.0, color: Color(0xFF929090)),
        //   ),
        // ),
        Flexible(child: TextWidget()),
        // Container(
        //     alignment: Alignment.bottomRight,
        //     color: Colors.blue,
        //     child: Text('10:00 PM')),



      ],
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('10:00 PM',
              style: TextStyle(fontSize: 10.0, color: Color(0xFF929090)),

            ),
          ),


        ],

      );
  }
}
