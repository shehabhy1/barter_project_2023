import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/deals_view/presentation/view/widgets/tab_bar_item.dart';
import 'package:flutter/material.dart';

import 'widgets/all_tap_view.dart';
import 'widgets/completed_tap_view.dart';
import 'widgets/inprogress_tap_view.dart';

class DealView extends StatefulWidget {
  const DealView({super.key});

  @override
  State<DealView> createState() => _DealViewState();
}

class _DealViewState extends State<DealView> {
  List<String> tabBarTitles = [
    'All',
    'Inprogress',
    'Completed',
  ];
  List<Widget> tabBarBody = const [AllTap(), InprogressTap(), CompletedTap()];
  int currnetIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Deals status',
          style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //tap bar buttons
            SizedBox(
              height: 60,
              width: context.deviceWidth,
              // width: double.infinity,
              child: ListView.builder(
                itemCount: tabBarTitles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currnetIndex = index;
                      });
                    },
                    child: TapBarItem(
                      index: index,
                      tabBarTitles: tabBarTitles,
                      currnetIndex: currnetIndex,
                    )),
              ),
            ),
            Expanded(child: tabBarBody[currnetIndex]),
          ],
        ),
      ),
    );
  }
}
