import 'package:flutter/material.dart';

class TextPicture extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final String icon;

  const TextPicture({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Image.asset(icon),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
