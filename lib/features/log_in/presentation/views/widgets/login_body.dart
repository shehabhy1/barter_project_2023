import 'package:barter_project_2023/features/log_in/presentation/views/widgets/another_acount.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/widgets/item_widget.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/widgets/second_row.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../core/shared_widget/default_text.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../layout/presentation/views/layout.dart';
import 'last_row.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
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
                'Login',
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
            const SizedBox(
              height: 8,
            ),
            defaultText(
              type: TextInputType.emailAddress,
              hint: 'Write your Email',
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
              validate: (val) {
                if (val.isEmpty || val.length < 6 || val.length > 16) {
                  return 'Password should contain at least 1 special character,the length should be \n between 6 to 16  character';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            const SecondRow(),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                width: double.infinity,
                height: 60,
                backgroundColor: kPrimaryColor,
                text: 'Log in',
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
            const LastLine(),
          ],
        ),
      ),
    );
  }
}
