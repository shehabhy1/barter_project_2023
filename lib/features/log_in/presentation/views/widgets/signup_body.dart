import 'package:barter_project_2023/core/shared_widget/check_button.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/widgets/create_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 20.w),
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
            SizedBox(
              height: 20.h,
            ),
            const Text(
              'First Name',
              style: Styles.textStyle20,
            ),
            SizedBox(
              height: 8.h,
            ),
            defaultText(
              type: TextInputType.text,
              hint: 'Write your First Name',
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Last Name',
              style: Styles.textStyle20,
            ),
            SizedBox(
              height: 8.h,
            ),
            defaultText(
              type: TextInputType.text,
              hint: 'Write your Last Name',
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Email',
              style: Styles.textStyle20,
            ),
            SizedBox(
              height: 8.h,
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
            SizedBox(
              height: 16.h,
            ),
            const RadioCheck(),
            Text(
              'Password',
              style: Styles.textStyle20,
            ),
            SizedBox(
              height: 8.h,
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
            SizedBox(
              height: 16.h,
            ),
            const Text(
              'Confirm Password',
              style: Styles.textStyle20,
            ),
            SizedBox(
              height: 8.h,
            ),
            defaultText(
              type: TextInputType.visiblePassword,
              hint: 'Confirm  your password',
            ),
            SizedBox(
              height: 8.h,
            ),
            const CheckButtom(text: 'I accepted privacy & Policy '),
            SizedBox(
              height: 20.h,
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
            SizedBox(
              height: 15.h,
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
