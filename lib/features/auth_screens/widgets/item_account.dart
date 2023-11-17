import 'package:flutter/material.dart';

class ItemAccount extends StatelessWidget {
  ItemAccount(
      {Key? key,
      required this.text,
      required this.imagePath,
      required this.onTap})
      : super(key: key);
  final String text;
  final String imagePath;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth * 0.8; // Adjust as needed
        final fontSize = constraints.maxWidth * 0.04; // Adjust as needed

        return GestureDetector(
          onTap: onTap,
          child: Center(
            child: Container(
              width: containerWidth,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color(0xFF8B8B8B),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(imagePath),
                  ),
                  const SizedBox(width: 5), // Use width instead of height
                  Text(
                    text,
                    style: TextStyle(
                      color: Color(0xFF767474),
                      fontSize: fontSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
