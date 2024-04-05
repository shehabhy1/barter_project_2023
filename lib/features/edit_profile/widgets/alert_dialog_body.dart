import 'package:flutter/material.dart';

class AlertDialogBody extends StatelessWidget {
  const AlertDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Remove profile photo?'),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.bodySmall,
            )),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Remove',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
