import 'package:flutter/material.dart';

class TopPartOfNotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0 , left: 10.0),
      child: Row(
        children: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.arrow_back_ios_outlined,
                color: Colors.black87,
              )),
          SizedBox(
            width: 45.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Notifiication',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
