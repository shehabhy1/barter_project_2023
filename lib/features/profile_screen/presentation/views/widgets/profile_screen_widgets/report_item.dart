import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/screens/report_view.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/screens/report_details_screen.dart';
import 'package:barter_project_2023/features/profile_screen/presentation/views/widgets/profile_screen_widgets/button_item.dart';
import 'package:flutter/material.dart';

class ReportItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 19, left: 19),
            child: InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportDetailsScreen()),
                );
              },
              child: Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AssetData.destroyedphonetest)),
                      // color: Color.fromARGB(255, 25, 20, 45),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Reason of Report',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ButtonItem(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0 , right: 16 , left: 16),
            child: Divider(
              color: Color.fromRGBO(159, 155, 155, 1.0),
            ),
          ),


        ],
      ),
    );
  }
}
