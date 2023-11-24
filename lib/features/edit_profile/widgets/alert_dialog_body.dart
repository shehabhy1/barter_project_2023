import 'package:flutter/material.dart';

class alertDialogBody extends StatelessWidget {
  const alertDialogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Remove profile photo?'),
      actions:
      [
        TextButton(onPressed: (){}, child: Text('Cancel',style: Theme.of(context).textTheme.caption,)),
        TextButton(onPressed: (){}, child: Text('Remove',style: TextStyle(color: Colors.red),)),
      ],
    );
  }
}
