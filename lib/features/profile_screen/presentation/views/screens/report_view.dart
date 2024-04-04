import 'package:barter_app/features/profile_screen/presentation/widgets/profile_screen_widgets/report_item_listview.dart';
import 'package:barter_app/features/profile_screen/presentation/widgets/profile_screen_widgets/top_part_of_profile_screen.dart';
import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TopPartOfProfileScreen(),
          ReportItemListView(),
        ],
      ),
    );
  }
}
