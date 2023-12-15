import 'package:barter_project_2023/features/add%20post/presentation/view/widgets/add_view_body.dart';
import 'package:barter_project_2023/features/add%20post/presentation/view/widgets/custom_drop_list.dart';
import 'package:flutter/material.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomDropList(),
    );
  }
}
