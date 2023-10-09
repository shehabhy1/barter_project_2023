import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../core/utils/styles.dart';
import '../../../custom_widgets/custom_check_box_rating.dart';
import '../../../custom_widgets/custom_checkbox.dart';

class ShowModelBottomSheet extends StatelessWidget {
  const ShowModelBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
      ),
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            buildSizedBox(34),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Location', style: Styles.textStyle16),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    FontAwesomeIcons.sortDown,
                    color: Constant.primaryColor,
                    size: 12,
                  ),
                )
              ],
            ),
            buildSizedBox(24),
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Quality ', style: Styles.textStyle16),
            ),
            buildSizedBox(19),
            const CustomCheckBox(
              text: 'Low',
            ),
            buildSizedBox(18),
            const CustomCheckBox(
              text: 'Medium',
            ),
            buildSizedBox(18),
            const CustomCheckBox(
              text: 'High',
            ),
            buildSizedBox(24),
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Review', style: Styles.textStyle16),
            ),
            buildSizedBox(16),
            const CustomCheckBoxRating(itemCount: 5),
            buildSizedBox(4),
            const CustomCheckBoxRating(itemCount: 4),
            buildSizedBox(4),
            const CustomCheckBoxRating(itemCount: 3),
            buildSizedBox(4),
            const CustomCheckBoxRating(itemCount: 2),
            buildSizedBox(4),
            const CustomCheckBoxRating(itemCount: 1),
            buildSizedBox(18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'Cancel',
                  textColor: Constant.primaryColor,
                  backgroundColor: Colors.white,
                  func: () {},
                ),
                CustomButton(
                  text: 'Apply',
                  backgroundColor: Constant.primaryColor,
                  textColor: Colors.white,
                  func: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

SizedBox buildSizedBox(double h) {
  return SizedBox(
    height: h,
  );
}
