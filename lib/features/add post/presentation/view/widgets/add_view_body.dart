
import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/features/add%20post/presentation/view_model/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_drop_list.dart';

class AddViewBody extends StatelessWidget {
  const AddViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        // File imageFile = PostCubit.get(context).imageFile;
        var cubit = PostCubit.get(context);
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: GestureDetector(
                          onTap: () {
                            cubit.getPostImage();
                          },
                          child: Container(
                              height: context.deviceHeight * 0.30,
                              width: context.deviceWidth * .9,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/add_post.png',
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFF8B8B8B)),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              //add file here
                              child: cubit.imageFile == null
                                  ? null
                                  : Image(
                                      image: FileImage(cubit.imageFile!),
                                      height: context.deviceHeight * 0.30,
                                      width: context.deviceWidth * .9,
                                      fit: BoxFit.fill,
                                    )),
                        ),
                      ),
                      //TODO: make this icon responsive
                      //To remove image
                      if (cubit.imageFile != null)
                        Positioned(
                          left: 280,
                          bottom: 180,
                          child: IconButton(
                              onPressed: () {
                                cubit.removeImage();
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: Constant.primaryColor,
                                size: 30,
                              )),
                        )
                    ],
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
      },
    );
  }
}
