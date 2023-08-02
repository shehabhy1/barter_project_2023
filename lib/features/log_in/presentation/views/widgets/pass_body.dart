import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/shared_widget/custom_buttom.dart';
import 'package:barter_project_2023/core/shared_widget/default_text.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/verify_view.dart';
import 'package:flutter/material.dart';

class PassBody extends StatelessWidget {
  const PassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 40 , horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Forget password',
              style: Styles.textStyle32,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Email',
            style: Styles.textStyle20,
          ),
          const SizedBox(height: 8,),
          defaultText(
              type: TextInputType.emailAddress,
            hint: 'Write Your Email'
          ),
          const SizedBox(height: 40,),
          CustomButton(
            width: double.infinity,
              height: 60,
              backgroundColor: kPrimaryColor,
              text: 'Send',
              func: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VerifyView()),
                        );
              }
          ),
        ],
      ),
    );
  }
}
