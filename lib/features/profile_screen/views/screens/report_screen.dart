import 'package:flutter/material.dart';

import '../../widgets/report_screen_widgets/top_part_of_report_screen.dart';

class ReportScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopPartOfReportScreen(),
        ],
      ),
    );
  }
}
