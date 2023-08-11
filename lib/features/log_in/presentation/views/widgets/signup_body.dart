import 'package:barter_project_2023/core/shared_widget/check_button.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/widgets/create_line.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../core/shared_widget/default_text.dart';
import '../../../../../core/shared_widget/radio_buttom.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../layout/presentation/views/layout.dart';
import 'another_acount.dart';
import 'item_widget.dart';

// validator not working methods like (.contain)
class SignupBody extends StatelessWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Create account',
                style: Styles.textStyle32,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              'First Name',
              style: Styles.textStyle20.copyWith(
              ),

            ),
            const SizedBox(
              height: 8,
            ),
            defaultText(
              type: TextInputType.text,
              hint: 'Write your First Name',
              prefix: Icons.person,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Last Name',
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 8,
            ),
            defaultText(
              type: TextInputType.text,
              hint: 'Write your Last Name',
              prefix: Icons.person,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Email',
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 8,
            ),
            defaultText(
              type: TextInputType.emailAddress,
              hint: 'Write your Email',
              prefix: Icons.mail,
              validate: (value) {
                if (value!.isEmpty || value!.contains('@')) {
                  return 'Email is Wrong You must write .com';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const RadioCheck(),
            const Text(
              'Password',
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 8,
            ),
            defaultText(
              type: TextInputType.visiblePassword,
              hint: 'Write your password',
              prefix: Icons.lock,
              validate: (val) {
                if (val.isEmpty || val.length < 6 || val.length > 16) {
                  return 'Password should contain at least 1 special character,the length should be \n between 6 to 16  character';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Repeat Password',
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 8,
            ),
            defaultText(
              type: TextInputType.visiblePassword,
              hint: 'Repeat  your password',
              prefix: Icons.password_outlined
            ),
            const SizedBox(
              height: 8,
            ),
            const CheckButtom(text: 'I accepted privacy & Policy '),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                width: double.infinity,
                height: 60,
                backgroundColor: kPrimaryColor,
                text: 'Sign Up',
                func: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LayoutView()),
                  );
                }),
            const SizedBox(
              height: 15,
            ),
            const AnotherAccount(),
            const ItemWidget(),
            const LastLineSign(),
          ],
        ),
      ),
    );
  }
}
