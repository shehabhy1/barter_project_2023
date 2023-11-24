import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ReportSuccessScreen extends StatelessWidget {
  const ReportSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetData.reportSuccessImage),
            SizedBox(
              height: 20,
            ),
            Text(
              'Congratulations, dear client! The report has been received. Your request will be reviewed, and we will respond to you as soon as possible to resolve your issue',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
