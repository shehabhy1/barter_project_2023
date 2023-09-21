import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Text(
      'Lorem ipsum dolor sit amet llllllllllllll kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkooooooooooooooooooooo',
      maxLines: 3,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 15.0, color: Color(0xFF929090)),
    );

  }
}
