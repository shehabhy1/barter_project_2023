import 'package:barter_app/features/profile_screen/presentation/widgets/report_details_screen_widgets/image_item.dart';
import 'package:flutter/material.dart';

import '../../widgets/report_details_screen_widgets/top_part_of_report_details_screen.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          const TopPartOfReportDetailsScreen(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 28.0),
            child: Column(children: [
              const Text('you can edit your report before you submit it'),
              const SizedBox(
                height: 20.0,
              ),
              const ImageItem(),

              const SizedBox(
                height: 20.0,
              ),
              const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Please write a reason',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'write the reason',
                  helperStyle: const TextStyle(
                    color: Color.fromRGBO(169, 165, 165, 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromRGBO(200, 201, 203, 1.0)), //<-- SEE HERE
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'write description',
                  helperStyle: const TextStyle(
                    color: Color.fromRGBO(169, 165, 165, 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromRGBO(200, 201, 203, 1.0)), //<-- SEE HERE
                  ),
                ),
              ),
              const SizedBox(
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
              const SizedBox(
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
                    color: const Color.fromRGBO(255, 255, 255, 1.0),
                    border: Border.all(
                      color: const Color.fromARGB(255, 183, 59, 255),
                        width: 1,
                      ),
                    borderRadius: const BorderRadius.all(
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
