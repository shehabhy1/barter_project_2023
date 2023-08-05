import 'package:barter_project_2023/features/home/presentation/view/widgets/custom_checkbox.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/list_view_some_products.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import 'widgets/list_tile_reviews.dart';
import 'widgets/row_text_view_all.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                flex: 4,
                child: CustomTextField(),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showBottomSheet(context: context,
                        builder:  (BuildContext context) {
                          return Container(
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                            ),
                            height: 500,
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 34,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                          'Location',
                                          style: Styles.textStyle16
                                      ),
                                      Container(
                                        width: 24,
                                        height: 24,
                                        child: const Icon(
                                          FontAwesomeIcons.sortDown,
                                          color: Constant.primaryColor,
                                          size: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: const Text(
                                      'Quality ',
                                      style: Styles.textStyle16
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 19,
                                  ),
                                  const CustomCheckBox(text: 'Low',),
                                  const SizedBox(
                                    height: 19,
                                  ),
                                  const CustomCheckBox(text: 'Medium',),
                                  const SizedBox(
                                    height: 19,
                                  ),
                                  const CustomCheckBox(text: 'High',),
                                  const SizedBox(
                                    height: 19,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5,color:  Constant.primaryColor)
                    )),
                    child: const Icon(
                      FontAwesomeIcons.filter,
                      color: Constant.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const RowTextViewAll(text: 'New',),
          const SizedBox(
            height: 16,
          ),
          const ListViewSomeProducts(),
          const SizedBox(
            height: 24,
          ),
          const RowTextViewAll(text: 'Recommendations',),
          const SizedBox(
            height: 16,
          ),
          const ListViewSomeProducts(),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Reviews',
            style:Styles.textStyle14.copyWith(
              color: Colors.black
            )
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'Now you can see all users have high rate ',
            style: Styles.textStyle14
          ),
          const SizedBox(
            height: 16,
          ),
          const ListTileOfReviews(),
        ],
      ),
    );
  }
}



