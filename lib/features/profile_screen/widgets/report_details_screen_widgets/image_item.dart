import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {

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
