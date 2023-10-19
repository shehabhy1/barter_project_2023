import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:barter_project_2023/features/auth_screens/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final PostModel postModel;
  final UserModel userModel;
  const ProductItem(
      {Key? key, required this.postModel, required this.userModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        // width: 170.h,
        // height: 180.w,
        height: context.deviceHeight / 2.8,

        width: context.deviceWidth / 2.1,

        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: NetworkImage(postModel.pic!),
                  width: 170.w,
                  fit: BoxFit.cover,
                  // height: 100.h,
                  height: 120.h,
                )),
            const SizedBox(height: 8),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  //TODO: add currnet user image
                  backgroundImage: AssetImage(
                    'assets/images/profile_img.png',
                  ),
                  radius: 18,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userModel.fName}' '${userModel.lName}',
                          style: Styles.textStyle14
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          postModel.disc,
                          style: Styles.textStyle12.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: const Color.fromARGB(255, 71, 35, 35),
                              fontSize: 12),
                        ),
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
