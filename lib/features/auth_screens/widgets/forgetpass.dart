import 'dart:developer';

import 'package:barter_project_2023/features/edit_profile/widgets/alert_dialog_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/shared_widget/custom_buttom.dart';
import '../../../core/shared_widget/default_text.dart';
import '../../../core/utils/styles.dart';
import '../log_in/presentation/views/verify_view.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Scaffold(
      //appBar: AppBar(leading: null,),
      body: SafeArea(
        child: Column(
          children: [
            /* Padding(
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
            ), */
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 50, horizontal: 20),
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
                  const SizedBox(
                    height: 8,
                  ),
                  defaultTextField(
                      type: TextInputType.emailAddress,
                      hint: 'Write Your Email',
                      controller: emailController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email most not empty';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      width: double.infinity,
                      height: 60,
                      backgroundColor: kPrimaryColor,
                      text: 'Send',
                      func: () async {
                        if (emailController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (builder) => AlertDialog(
                                    title: Text('email is empty'),
                                    content: Text('please put your email'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("okay"),
                                        ),
                                      ),
                                    ],
                                  ));
                          ;
                        } else {
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: emailController.text);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('email sent successfully')));
                        }
                        /*  FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text); */
                        log('message');
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
