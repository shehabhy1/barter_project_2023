// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barter_project_2023/features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/screens/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../profile_screen/presentation/view_model/cubit/profile_cubit.dart';

class ListTileOfReviews extends StatelessWidget {
  final String userName;
  ListTileOfReviews({
    Key? key,
    required this.userName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: BlocBuilder<AuthCubit, AuthState>(builder: (builder, state) {
        var userData = AuthCubit.get(context);
        String phone = 'https://wa.me/+20${userData.userModel!.whatsapp}';
        return ListTile(
            contentPadding: EdgeInsets.zero,
            // subtitle: Text('+20${userData.userModel!.whatsapp}'),
            title: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                  '${userData.userModel!.fName}' '${userData.userModel!.lName}',
                  style: Styles.textStyle14.copyWith(color: Colors.black)),
            ),
            trailing: IconButton(
              onPressed: () {
                final Uri whats = Uri.parse(phone);
                launchUrl(whats);
              },
              icon: Icon(Icons.message),
            ),
            leading: IconButton(
                icon: Icon(Icons.report),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => ReportScreen()));
                }));
      }),
      /* ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(userName,
                style: Styles.textStyle14.copyWith(color: Colors.black)),
          ),
          trailing: IconButton(
            onPressed: () {
              final Uri whats = Uri.parse(phone);
              launchUrl(whats);
            },
            icon: Icon(Icons.message),
          ),
          leading: IconButton(
              icon: Icon(Icons.report),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ReportScreen()));
              }) */
      // when the user press on icon navigate to report him
      // this icon to message the user to exchange it
      // trailing: const Text('20 product', style: Styles.textStyle14),
      // subtitle: const SubTitleRating(),
      /*  leading: Image.asset(
          Assets.imagesImg,
          width: 54,
        ), */
    );
  }
}
