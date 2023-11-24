import 'package:flutter/material.dart';

class AnotherAccount extends StatelessWidget {
  const AnotherAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(child: Divider(
            thickness: .8,
            color: Colors.black,
          ),),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('OR'),
          ),
          Expanded(child: Divider(
            thickness: .8,
            color: Colors.black,
          ),),
        ],
      ),
    );
  }
}
