import 'package:barter_app/features/profile_screen/presentation/views/screens/report_success_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/report_screen_widgets/top_part_of_report_screen.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopPartOfReportScreen(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 28.0),
              child: Column(children: [
                const Text(
                  'Report user ID (user ID is used only for feedback on complaint processing and will not be disclosed to any third parties',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30.0,
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
                          width: 1,
                          color: Color.fromRGBO(
                              200, 201, 203, 1.0)), //<-- SEE HERE
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
                      style:  TextStyle(
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
                          width: 1,
                          color: Color.fromRGBO(
                              200, 201, 203, 1.0)), //<-- SEE HERE
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Image',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[400]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.camera_enhance_outlined))),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReportSuccessScreen(),
                        ));
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
                      child: Text(
                        'Submit',
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
              ]),
            )
          ],
        ),
      ),
    );
  }
}
