import 'package:barter_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';

class TopPartOfReportDetailsScreen extends StatelessWidget {
  const TopPartOfReportDetailsScreen({super.key});

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
              'Report Details',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
