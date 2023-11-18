// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:barter_project_2023/features/profile_screen/presentation/views/screens/report_screen.dart';
import 'package:flutter/material.dart';

import 'package:barter_project_2023/app_img/assets.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/sub_title_rating.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';

class ListTileOfReviews extends StatelessWidget {
  final String userName;
  const ListTileOfReviews({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(userName,
                style: Styles.textStyle14.copyWith(color: Colors.black)),
          ),
          trailing: IconButton(
            onPressed: () {
              final Uri whats = Uri.parse('https://wa.me/+2001007235515');
              launchUrl(whats);
            },
            icon: Icon(Icons.message),
          ),
          leading: IconButton(
              icon: Icon(Icons.report),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ReportScreen()));
              })
          // when the user press on icon navigate to report him
          // this icon to message the user to exchange it
          // trailing: const Text('20 product', style: Styles.textStyle14),
          // subtitle: const SubTitleRating(),
          /*  leading: Image.asset(
          Assets.imagesImg,
          width: 54,
        ), */
          ),
    );
  }
}
