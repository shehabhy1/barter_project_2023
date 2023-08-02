import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../core/shared_widget/default_text.dart';
import '../../../../../core/utils/styles.dart';

class NewPassBody extends StatelessWidget {
  const NewPassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40 , horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              'New password',
              style: Styles.textStyle32,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'New Password',
            style: Styles.textStyle20,
          ),
          const SizedBox(height: 8,),
          defaultText(
              type: TextInputType.visiblePassword,
              hint: 'Write your password'
          ),
          SizedBox(height: 16,),
          const Text(
            'Repeat Password',
            style: Styles.textStyle20,
          ),
          const SizedBox(height: 8,),
          defaultText(
              type: TextInputType.visiblePassword,
              hint: 'Write your password'
          ),
          SizedBox(height: 40,),
          CustomButton(
              width: double.infinity,
              height: 60,
              backgroundColor: kPrimaryColor,
              text: 'Send',
              func: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const VerifyView()),
                // );
              }
          ),
        ],
      ),
    );;
  }
}
