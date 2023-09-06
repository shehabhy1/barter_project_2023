// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/have_and_need_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HaveAndNeedView extends StatelessWidget {
  const HaveAndNeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Have And Need'),
        titleTextStyle: Styles.textStyle24.copyWith(fontSize: 22.sp),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: const HaveAndNeddViewBody(),
    );
  }
}
