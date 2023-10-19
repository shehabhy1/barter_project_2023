// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/add%20post/presentation/view_model/cubit/post_cubit.dart';
import 'package:barter_project_2023/features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/have_and_need_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HaveAndNeedView extends StatefulWidget {
  const HaveAndNeedView({super.key});

  @override
  State<HaveAndNeedView> createState() => _HaveAndNeedViewState();
}

class _HaveAndNeedViewState extends State<HaveAndNeedView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).getUserData();
    BlocProvider.of<PostCubit>(context).getMyPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Have And Need'),
        titleTextStyle: Styles.textStyle24.copyWith(fontSize: 22),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocConsumer<PostCubit, PostState>(
            listener: (context, state) {
             
            },
            builder: (context, state) {
              var aCubit = BlocProvider.of<AuthCubit>(context);
              var pCubit = BlocProvider.of<PostCubit>(context);
              return HaveAndNeddViewBody(
                posts: pCubit.posts,
                user: aCubit.userModel!,
              );
            },
          );
        },
      ),
    );
  }
}
