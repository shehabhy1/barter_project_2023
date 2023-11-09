import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 90.0,
        height: 35.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 76, 217, 100),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: const Center(
          child: Text(
            'Submited',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(255, 255, 255, 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
