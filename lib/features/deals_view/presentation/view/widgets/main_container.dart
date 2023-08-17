import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MainContainer extends StatelessWidget {
  final String imagePath;
  final String imagePath2;
  final String text;
  final String text1;
  final String date;
  final String date1;
  const MainContainer({Key? key, required this.imagePath, required this.imagePath2, required this.text, required this.text1, required this.date, required this.date1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFDADADA)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Padding(
     padding: const EdgeInsets.all(20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, fit: BoxFit.fill,width: 100, height: 100,),
          const SizedBox(height: 8), // Add spacing between the image and text
          Text(
            text,
            style: Styles.textStyle16,
          ),
          const SizedBox(height: 2),
          Text(
            date,
            style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w500,),
          ),
        ],
      ),
     ),
         SvgPicture.asset('assets/images/arrow-2.svg'),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             // mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Image.asset(imagePath2, fit: BoxFit.fill,),
               const SizedBox(height: 8), // Add spacing between the image and text
               Text(
                 text1,
                 style: Styles.textStyle16,
               ),
               const SizedBox(height: 2),
                Text(
                 date1,
                 style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w500,),
               ),
             ],
           ),
         ),
       ],
     ),
    );
  }
}
