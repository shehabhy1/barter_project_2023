import 'package:flutter/material.dart';

class ItemAccount extends StatelessWidget {
  const ItemAccount({Key? key, required this.text, required this.imagePath})
      : super(key: key);
  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: const Color(0xFF8B8B8B),
            // Customize the border color for the selected and unselected states
            width: 1, // Adjust the border width as needed
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imagePath),),
            const SizedBox(height: 5,),
            Text(
                text,
              style: const TextStyle(
                color: Color(0xFF767474),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
