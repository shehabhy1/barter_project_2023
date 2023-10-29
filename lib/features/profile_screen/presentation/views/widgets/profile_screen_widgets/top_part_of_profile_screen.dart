import 'package:barter_project_2023/features/profile_screen/presentation/views/screens/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopPartOfProfileScreen extends StatelessWidget {
  const TopPartOfProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 10.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black87,
              )),
          const SizedBox(
            width: 45.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'All Reports',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 47.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportScreen()),
                  );
                },
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}
