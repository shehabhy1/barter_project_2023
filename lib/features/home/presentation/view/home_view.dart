import 'package:barter_project_2023/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/list_view_some_products.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/show_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import 'widgets/list_tile_reviews.dart';
import 'widgets/row_text_view_all.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //final List<String> items = List.generate(10, (index) => 'Item $index');
  var userproducts = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userproducts.collection('products').snapshots(),
      builder: (context, snapshot) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 4, // Spacing between columns
          mainAxisSpacing: 4, // Spacing between rows
        ),
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          final item = snapshot.data!.docs[index];
          final Map<String, dynamic> data = item.data();
          final desc = data['description'];
          final pic = data['pic'];
          return TextButton(
            onPressed: () {
              context.pushNamed(AppRouter.kProductDetails);
              // context.go(AppRouter.kProductDetails);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.42,
              height: 150.h,
              padding: const EdgeInsets.only(bottom: 12),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFE6E6E6)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: ListView(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    subtitle: Text(
                      '$desc',
                      style: Styles.textStyle14.copyWith(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    /* leading: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.asset(
                        AssetData.imagesProfileImg,
                        width: 25,
                        height: 25,
                      ),
                    ), */
                    title: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Image.network(
                          pic,
                          width: 32,
                          height: 64,
                        )
                        /*  Image.asset(
                        AssetData.imagesImg,
                        width: 32,
                        height: 64,
                      ), */
                        ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(maximumSize: Size(60, 25)),
                        onPressed: () => Get.to('page'),
                        child: Text('discover'),
                      ) /* Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: Constant.primaryColor),
                      child: Text('Discover',
                          style:
                              Styles.textStyle14.copyWith(color: Colors.white)),
                    ), */
                      )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox buildSizedBox(double h) {
    return SizedBox(
      height: h,
    );
  }

  void showBottomSheetFilter(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ShowModelBottomSheet();
      },
    );
  }
}
//context.pushNamed(AppRouter.kProductDetails);
                    // context.go(AppRouter.kProductDetails);

                    /* 
                    ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                context.pushNamed(AppRouter.kProductDetails);
                // context.go(AppRouter.kProductDetails);
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.42,
                padding: const EdgeInsets.only(bottom: 12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFE6E6E6)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListView(
                    children: [
                      Image.asset(
                        AssetData.imagesImg,
                        width: 128,
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text('mohamed Gehad',
                            style: Styles.textStyle14
                                .copyWith(color: Colors.black)),
                        subtitle: const Text('Description ',
                            style: Styles.textStyle12),
                        leading: Image.asset(
                          AssetData.imagesProfileImg,
                          width: 28,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 80,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              color: Constant.primaryColor),
                          child: Text('Discover',
                              style: Styles.textStyle14
                                  .copyWith(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: 3),
                     */