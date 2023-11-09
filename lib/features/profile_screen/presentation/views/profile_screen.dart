import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/widgets/profile_screen_widgets/report_item_listview.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/widgets/profile_screen_widgets/top_part_of_profile_screen.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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


