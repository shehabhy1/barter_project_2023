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
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28.0,
                    backgroundImage: AssetImage(AssetData.notiPhoto
                    ),

                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet\n'
                        'consectetur adipiscing elit, sed\n'
                        'diam nonummy \n'
                        ' nibh euismod',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                      '10:00 PM'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
