import 'package:barter_project_2023/features/log_in/presentation/views/widgets/item_account.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ItemAccount(
              text: ' Continue with Google',
              imagePath: 'assets/images/facebook.png',
          ),
          SizedBox(height: 15,),
          ItemAccount(text: ' Continue with Facebook',
              imagePath: 'assets/images/google.png',
          ),
        ],
      ),
    );
  }
}
