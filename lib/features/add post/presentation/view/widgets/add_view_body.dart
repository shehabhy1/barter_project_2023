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
              //TODO: remove this app bar and edit image

              // const CustomPostOptionsAppBar(),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/add_post.png",
                  height: MediaQuery.of(context).size.height * .377,
                  width: MediaQuery.of(context).size.width * .86,
                  fit: BoxFit.cover,
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
