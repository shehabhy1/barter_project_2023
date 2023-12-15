import 'package:barter_project_2023/core/shared_widget/check_button.dart';
import 'package:barter_project_2023/features/log_in/logic/signupcontrol.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/widgets/create_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../constants.dart';
import '../../../../../core/shared_widget/custom_buttom.dart';
import '../../../../../core/shared_widget/default_text.dart';
import '../../../../../core/shared_widget/radio_buttom.dart';
import '../../../../../core/utils/styles.dart';
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
        child: GetBuilder<ControlSignUp>(
          init: ControlSignUp(),
          builder: (controller) => Column(
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
              GestureDetector(
                onTap: () {
                  controller.selectImage();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 80,
                    backgroundImage: controller.file != null
                        ? FileImage(controller.file!)
                        : null,
                    child: controller.file == null
                        ? const Icon(
                            Icons.camera_alt,
                            size: 60,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'First Name',
                style: Styles.textStyle20,
              ),
              SizedBox(
                height: 8.h,
              ),
              defaultTextField(
                type: TextInputType.text,
                hint: 'Write your First Name',
                controller: controller.firstNameController,
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
              defaultTextField(
                type: TextInputType.text,
                hint: 'Write your Last Name',
                controller: controller.lastNameController,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Email',
                style: Styles.textStyle20,
              ),
              SizedBox(
                height: 8.h,
              ),
              defaultTextField(
                type: TextInputType.emailAddress,
                hint: 'Write your Email',
                controller: controller.emailController,
              ),
              SizedBox(
                height: 16.h,
              ),
              const Text(
                'Gender',
                style: Styles.textStyle20,
              ),
              RadioCheck(
                value: 'male',
                groupValue: controller.gender,
                onChanged: (newVal) {
                  controller.gender = newVal.toString();
                  controller.update();
                },
                text: 'male',
              ),
              SizedBox(
                height: 5.h,
              ),
              RadioCheck(
                value: 'female',
                groupValue: controller.gender,
                onChanged: (newVal) {
                  controller.gender = newVal.toString();
                  controller.update();
                },
                text: 'female',
              ),
              Text(
                'Password',
                style: Styles.textStyle20,
              ),
              SizedBox(
                height: 8.h,
              ),
              defaultTextField(
                  type: TextInputType.visiblePassword,
                  hint: 'Write your password',
                  controller: controller.passwordController),
              SizedBox(
                height: 16.h,
              ),
              CheckButtom(text: 'I accepted privacy & Policy '),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  width: double.infinity,
                  height: 60.h,
                  backgroundColor: kPrimaryColor,
                  text: 'Sign Up',
                  onPressed: () {
                    controller.signup();
                    /*  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LayoutView()),
                    ); */
                  }),
              SizedBox(
                height: 15.h,
              ),
              AnotherAccount(),
              ItemWidget(),
              LastLineSign(),
            ],
          ),
        ),
      ),
    );
  }
}
