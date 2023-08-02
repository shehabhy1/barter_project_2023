import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_widget/check_button.dart';
import '../../../../../core/utils/styles.dart';
import '../password_view.dart';

class SecondRow extends StatelessWidget {
  const SecondRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CheckButtom(
          text: 'Remember me',
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PassView()),
            );
          },
          child: Text(
            'Forget password?',
            style: Styles.textStyle20.copyWith(fontSize: 14  , color: kPrimaryColor),),
        ),
      ],
    );
  }
}
