import 'package:flutter/material.dart';

import 'item_account.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          ItemAccount(
            text: ' Continue with Facebook',
            imagePath: 'assets/images/facebook.png',
          ),
          SizedBox(
            height: 15,
          ),
          ItemAccount(
            text: ' Continue with Google',
            imagePath: 'assets/images/google.png',
          ),
        ],
      ),
    );
  }
}
