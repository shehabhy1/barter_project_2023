import 'package:barter_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 180.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetData.destroyedphonetest),

            fit: BoxFit.fill
        ),
        // color: Color.fromARGB(255, 25, 20, 45),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );

  }
}
