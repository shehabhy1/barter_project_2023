import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class ListViewSomeProducts extends StatelessWidget {
  const ListViewSomeProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.37,
      child: ListView.separated(
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
                      /*  Image.asset(
                        Assets.imagesImg,
                        width: 128,
                      ), */
                      const SizedBox(height: 8),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text('mohamed Gehad',
                            style: Styles.textStyle14
                                .copyWith(color: Colors.black)),
                        subtitle: const Text('Description ',
                            style: Styles.textStyle12),
                        /*   leading: Image.asset(
                          Assets.imagesProfileImg,
                          width: 28,
                        ), */
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
    );
  }
}
