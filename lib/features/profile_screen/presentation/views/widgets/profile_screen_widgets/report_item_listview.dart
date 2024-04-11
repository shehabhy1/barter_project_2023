import 'package:barter_app/features/profile_screen/presentation/views/widgets/profile_screen_widgets/report_item.dart';
import 'package:flutter/material.dart';

class ReportItemListView extends StatelessWidget {
  const ReportItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: check list isEmpty or not to show another screen
    return Expanded(
      child: ListView.builder(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ReportItem();
          }),
    );
  }
}
