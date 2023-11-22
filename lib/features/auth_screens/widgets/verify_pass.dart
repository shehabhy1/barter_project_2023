/* import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../../core/utils/styles.dart';
import '../log_in/presentation/views/new_view.dart';
import 'verify_otp.dart';

class VerifyPass extends StatelessWidget {
  const VerifyPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 10),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10, horizontal: 20),
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
                height: 10,
              ),
              Center(
                child: Text(
                  'Enter the 4-digital code sent to you at ',
                  style: Styles.textStyle20.copyWith(
                    color: const Color(
                      (0xFF8B8B8B),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '0813-3754-6113',
                  style: Styles.textStyle20.copyWith(
                    color: const Color(
                      (0xFF8B8B8B),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const VerifyOtp(),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                  width: double.infinity,
                  height: 60,
                  backgroundColor: kPrimaryColor,
                  text: 'Send',
                  func: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPass()),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
 */