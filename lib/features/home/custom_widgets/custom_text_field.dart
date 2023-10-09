import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: Styles.textStyle14,
        contentPadding: EdgeInsets.zero,
        prefixIcon: const Icon(FontAwesomeIcons.search),
        border:  OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.25,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFF171717),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}