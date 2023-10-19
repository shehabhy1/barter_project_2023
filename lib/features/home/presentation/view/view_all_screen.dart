import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import 'package:barter_project_2023/app_img/assets.dart';

class ViewAllScreen extends StatelessWidget {
  final List<PostModel> posts;
  const ViewAllScreen({Key? key, required this.posts}) : super(key: key);

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
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: Styles.textStyle14,
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: const Icon(
                      // search deprecated so i have used magnifyingGlass instead
                      FontAwesomeIcons.magnifyingGlass,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.25,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF171717),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 0.5, color: Constant.primaryColor))),
                child: const Icon(
                  FontAwesomeIcons.filter,
                  color: Constant.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'All products',
            style: TextStyle(
              color: Color(0xFF171717),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.7,
            width: 150,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.31,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ItemBuilder();
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 16,
                          );
                        },
                        itemCount: 3),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemCount: 3),
          ),
          // SizedBox(
          //   height: MediaQuery.sizeOf(context).height * 0.31,
          //   child: ListView.separated(
          //       physics: const BouncingScrollPhysics(),
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context , index) {
          //         return Container(
          //           width: MediaQuery.sizeOf(context).width * 0.42,
          //           padding: const EdgeInsets.only(bottom: 16),
          //           decoration: ShapeDecoration(
          //             shape: RoundedRectangleBorder(
          //               side: const BorderSide(width: 0.50, color: Color(0xFFE6E6E6)),
          //               borderRadius: BorderRadius.circular(8),
          //             ),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(2.0),
          //             child: Column(
          //               children: [
          //                 Image.asset(Assets.imagesImg,width: 128,),
          //                 const SizedBox(height: 8),
          //                 ListTile(
          //                   contentPadding: EdgeInsets.zero,
          //                   title:  Text(
          //                       'mohamed Gehad',
          //                       style: Styles.textStyle14.copyWith(
          //                           color: Colors.black
          //                       )
          //                   ),
          //                   subtitle: const Text(
          //                       'Description ',
          //                       style: Styles.textStyle12
          //                   ),
          //                   leading: Image.asset(Assets.imagesImg2,width: 28,),
          //                 ),
          //                 const SizedBox(height: 8),
          //                 Align(
          //                   alignment: Alignment.bottomRight,
          //                   child: Container(
          //                     width: 80,
          //                     height: 30,
          //                     alignment: Alignment.center,
          //                     decoration: ShapeDecoration(shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(16)
          //                     ),
          //                         color: Constant.primaryColor),
          //                     child: Text(
          //                         'Discover',
          //                         style: Styles.textStyle14.copyWith(
          //                             color: Colors.white
          //                         )
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         );
          //       }, separatorBuilder: (context , index) {
          //     return const SizedBox(
          //       width: 16,
          //     );
          //   }, itemCount: 3),
          // ),
        ],
      ),
    );
  }
}

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.42,
      padding: const EdgeInsets.only(bottom: 16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Image.asset(
              Assets.imagesImg,
              width: 90,
            ),
            const SizedBox(height: 4),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('mohamed Gehad',
                  style: Styles.textStyle14.copyWith(color: Colors.black)),
              subtitle: const Text('Description ', style: Styles.textStyle12),
              leading: Image.asset(
                Assets.imagesImg2,
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
                    style: Styles.textStyle14.copyWith(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
