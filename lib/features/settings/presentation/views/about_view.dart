import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/about_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          iconSize: 30.sp,
        ),
        title: const Text('About', style: Styles.textStyle24),
        centerTitle: true,
      ),
      body: const AboutViewBody(),
    );
  }
}

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: SizedBox(
                      width: 382.w,
                      child: Text(
                        'Do you want to logout?',
                        style: Styles.textStyle16
                            .copyWith(color: const Color(0xff626262)),
                      ),
                    ),
                    insetPadding: const EdgeInsets.symmetric(horizontal: 200),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            'Cancel',
                            style: Styles.textStyle16
                                .copyWith(color: const Color(0xff626262)),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'LogOut',
                            style:
                                Styles.textStyle16.copyWith(color: Colors.red),
                          )),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp)),
                  ));
        },
        child: const Text('alelrt'));
  }
}
