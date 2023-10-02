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
    var emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return  Form(
      key:formKey ,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 10),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 10 , horizontal: 20),
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
                    hint: 'Write Your Email',
                    controller: emailController,
                    validate: (value)
                    {
                      if(value!.isEmpty)
                      {

                        return 'Email most not empty';
                      }
                      else{
                        return null;}
                    }
                ),
                const SizedBox(height: 40,),
                CustomButton(
                  width: double.infinity,
                    height: 60,
                    backgroundColor: kPrimaryColor,
                    text: 'Send',
                    func: (){
                      if(formKey.currentState!.validate())
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VerifyView()),
                        );
                      }
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
