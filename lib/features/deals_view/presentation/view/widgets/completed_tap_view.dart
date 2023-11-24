import 'package:flutter/material.dart';

import 'main_container.dart';

class CompletedTap extends StatelessWidget {
  const CompletedTap({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MainContainer(
              imagePath: 'assets/images/unsplash_kvmdsTrGOBM.png',
              imagePath2: 'assets/images/unsplash_gUPiTDBdRe4.png',
              text: 'Book1',
              text1: 'Book2',
              date: '12/7/2023',
              date1: '12/7/2023',
            ),
            SizedBox(height: 16,),
            MainContainer(
              imagePath: 'assets/images/unsplash_kvmdsTrGOBMc.png',
              imagePath2: 'assets/images/unsplash_kvmdsTrGOBMa.png',
              text: 'Book1',
              text1: 'Book2',
              date: '12/7/2023',
              date1: '12/7/2023',
            ),
          ],
        ),
      ),
    );
  }
}
