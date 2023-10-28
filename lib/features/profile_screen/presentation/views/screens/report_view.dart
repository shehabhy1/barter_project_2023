import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/widgets/profile_screen_widgets/report_item.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/widgets/profile_screen_widgets/report_item_listview.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/widgets/profile_screen_widgets/top_part_of_profile_screen.dart';
import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopPartOfProfileScreen(),
          ReportItemListView(),
        ],
      ),
    );
  }
}
