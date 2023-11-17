import 'dart:developer';

import 'package:flutter/material.dart';

import '../log_in/view_model/auth_cubit.dart';
import 'item_account.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          ItemAccount(
            onTap: () => log(
                'message from facebook'), //AuthCubit.get(context).signInWithFacebook() ,
            text: ' Continue with Facebook',
            imagePath: 'assets/images/facebook.png',
          ),
          SizedBox(
            height: 15,
          ),
          ItemAccount(
            onTap: () => log('message from facebook'),
            text: ' Continue with Google',
            imagePath: 'assets/images/google.png',
          ),
        ],
      ),
    );
  }
}
