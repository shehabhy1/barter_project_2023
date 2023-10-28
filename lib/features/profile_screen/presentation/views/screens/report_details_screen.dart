import 'package:barter_project_2023/features/profile_screen/presentation/views/widgets/report_details_screen_widgets/image_item.dart';
import 'package:flutter/material.dart';

import '../widgets/report_details_screen_widgets/top_part_of_report_details_screen.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          TopPartOfReportDetailsScreen(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 28.0),
            child: Column(children: [
              Text('you can edit your report before you submit it'),
              SizedBox(
                height: 20.0,
              ),
              ImageItem(),

              SizedBox(
                height: 20.0,
              ),
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Please write a reason',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'write the reason',
                  helperStyle: TextStyle(
                    color: Color.fromRGBO(169, 165, 165, 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(200, 201, 203, 1.0)), //<-- SEE HERE
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'write description',
                  helperStyle: TextStyle(
                    color: Color.fromRGBO(169, 165, 165, 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(200, 201, 203, 1.0)), //<-- SEE HERE
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: ()
                {


                },
                child: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 183, 59, 255),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: const Center(
                    child: Text('Submit',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              InkWell(
                onTap: ()
                {


                },
                child: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration:  BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    border: Border.all(
                      color: Color.fromARGB(255, 183, 59, 255),
                        width: 1,
                      ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),


                  ),
                  child: const Center(
                    child: Text('Cancel',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 183, 59, 255),
                      ),
                    ),
                  ),
                ),
              ),

            ]),
          )
      ],
    ),
        ));
  }
}
