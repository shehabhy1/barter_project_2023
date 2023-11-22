import 'package:barter_project_2023/core/shared_widget/default_text.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:barter_project_2023/features/add%20post/data/model/specific_post_model.dart';
import 'package:barter_project_2023/features/add%20post/presentation/view_model/cubit/post_cubit.dart';
import 'package:barter_project_2023/features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:barter_project_2023/features/auth_screens/model/user_model.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/have_product_item_.dart';
import 'package:barter_project_2023/features/settings/presentation/views/widgets/need_product_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAndNeddViewBody extends StatelessWidget {
  const HaveAndNeddViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var aCubit = AuthCubit.get(context);
        return BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            var pCubit = PostCubit.get(context);
            return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Have',
                        style: Styles.textStyle20.copyWith(fontSize: 20)),
                    const SizedBox(height: 15),
                    //TODO: handle loading state
                    pCubit.isHaveListNotEmpty
                        ? const Center(
                            child: Text('Ther is no products'),
                          )
                        : ConditionalBuilder(
                            condition: pCubit.myHaveList.isEmpty ||
                                aCubit.userModel == null,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            fallback: (context) => SizedBox(
                              height: 200.h,
                              width: double.infinity,
                              child: myHaveList(
                                  pCubit.myHaveList, aCubit.userModel!),
                            ),
                          ),

                    Text('My Needs',
                        style: Styles.textStyle20.copyWith(fontSize: 20)),
                    SizedBox(height: 15.h),
                    pCubit.isNeedListEmpty
                        ? const Center(
                            child: Text('Ther is no products'),
                          )
                        : ConditionalBuilder(
                            condition: pCubit.myNeedList.isEmpty ||
                                aCubit.userModel == null,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            fallback: (context) => SizedBox(
                              height: 200.h,
                              width: double.infinity,
                              child: myNeedList(
                                  pCubit.myNeedList, aCubit.userModel!),
                            ),
                          )
                    // : const Center(
                    //     child: Text('Ther is no products'),
                    //   )
                    ,
                    // SizedBox(height: 160.h, child: myNeedList(posts, user)),
                  ],
                ));
          },
        );
      },
    );
  }

  ListView myHaveList(List<PostModel> posts, UserModel user) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          HaveProductItem(product: posts[index], userModel: user),
      itemCount: posts.length,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
    );
  }

  ListView myNeedList(List<PostModel> needs, UserModel user) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          NeedProductItem(product: needs[index], userModel: user),
      itemCount: needs.length,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
    );
  }
}
