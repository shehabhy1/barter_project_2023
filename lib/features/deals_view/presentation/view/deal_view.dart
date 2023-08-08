import 'package:barter_project_2023/features/deals_view/presentation/view/widgets/tab_bar_item.dart';
import 'package:flutter/material.dart';

import 'all_tap_view.dart';
import 'completed_tap_view.dart';
import 'inprogress_tap_view.dart';

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
        title: const Text(
          'Deals Status',
          style: TextStyle(color: Colors.black),
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
              // width: double.infinity,
              child: Expanded(
                child: ListView.builder(
                  itemCount: tabBarTitles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currnetIndex = index;
                          });
                        },
                        child: TabBarItem(
                          index: index,
                          tabBarTitles: tabBarTitles,
                          currnetIndex: currnetIndex,
                        )),
                  ),
                ),
              ),
            ),
            tabBarBody[currnetIndex],
          ],
        ),
      ),
    );
  }
}
