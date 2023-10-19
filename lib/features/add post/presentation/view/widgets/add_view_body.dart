import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:flutter/material.dart';

import 'custom_drop_list.dart';

class AddViewBody extends StatelessWidget {
  const AddViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              // Row(
              //   // don't repeat the widgets use listview.builder instead
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     GestureDetector(
              //       onTap: () {},
              //       child: Image.asset(
              //         "assets/images/add_post.png",
              //         // the height and weight must be responsive
              //         // so use media query instead of fixed size
              //         height: 100, //MediaQuery.of(context).size.height * .100,
              //         width: 100, //MediaQuery.of(context).size.width * .32,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () {},
              //       child: Image.asset(
              //         "assets/images/add_post.png",
              //         // the height and weight must be responsive
              //         // so use media query instead of fixed size
              //         height: 100, //MediaQuery.of(context).size.height * .100,
              //         width: 100, //MediaQuery.of(context).size.width * .32,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: () {},
              //       child: Image.asset(
              //         "assets/images/add_post.png",
              //         // the height and weight must be responsive
              //         // so use media query instead of fixed size
              //         height: 100, //MediaQuery.of(context).size.height * .100,
              //         width: 100, //MediaQuery.of(context).size.width * .32,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ],
              // ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: context.deviceHeight * 0.30,
                  width: context.deviceWidth * .9,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/add_post.png',
                        )),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF8B8B8B)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              const CustomDropList(),
            ],
          ),
        ),
      ],
    );
  }
}
