import 'package:barter_project_2023/features/home/presentation/view/home_view.dart';
import 'package:barter_project_2023/features/home/presentation/view/view_all_screen.dart';
import 'package:barter_project_2023/features/log_in/logic/logincontrol.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/widgets/another_acount.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/widgets/item_widget.dart';
import 'package:barter_project_2023/features/log_in/presentation/views/widgets/second_row.dart';
import 'package:barter_project_2023/features/profilenavbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: GetBuilder<ControlLogin>(
          init: ControlLogin(),
          builder: (controller) => Column(
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
              defaultTextField(
                  type: TextInputType.emailAddress,
                  hint: 'Write your Email',
                  controller: controller.emailController),
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
              defaultTextField(
                  type: TextInputType.visiblePassword,
                  hint: 'Write your password',
                  controller: controller.passwordController),
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
                  onPressed: () {
                    controller.login();
                    //Get.to(UserLayout());
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
      ),
    );
  }
}
