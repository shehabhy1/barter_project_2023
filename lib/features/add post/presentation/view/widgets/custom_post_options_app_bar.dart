import 'package:flutter/material.dart';
class CustomPostOptionsAppBar extends StatelessWidget {
  const CustomPostOptionsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children:
        [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
          SizedBox(width: 30,),
          Center(
            child: Text(
              'Enter the item to swap it',
              style:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                //  height: 36,
              ),
            ),
          ),
        ],
      ),

    );
  }
}