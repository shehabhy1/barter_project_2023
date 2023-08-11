import 'package:barter_project_2023/features/home/presentation/view/widgets/custom_drop_list.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/custom_post_options_app_bar.dart';
import 'package:barter_project_2023/generated/assets.dart';
import 'package:flutter/material.dart';
class AddView extends StatelessWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers:
      [

       SliverFillRemaining(
         hasScrollBody: false,
         child: Column(
            children:
            [
              const CustomPostOptionsAppBar(),
              const SizedBox(height: 10,),
              GestureDetector(
              onTap:()
              {
              },
              child: Image.asset("assets/images/add_post.png",
                height: MediaQuery.of(context).size.height *.378,
                width: MediaQuery.of(context).size.width *.86,
                fit: BoxFit.cover,
              ),
            ),
              const SizedBox(height: 10,),
              const CustomDropList(),
            ],
      ),
       ),
    ],
    );
  }
}