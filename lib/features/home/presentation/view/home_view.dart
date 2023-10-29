import 'package:barter_project_2023/features/add%20post/presentation/view_model/cubit/post_cubit.dart';
import 'package:barter_project_2023/features/auth_screens/log_in/view_model/auth_cubit.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/list_view_some_products.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import '../../custom_widgets/custom_text_field.dart';
import 'widgets/list_tile_reviews.dart';
import 'widgets/row_text_view_all.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<AuthCubit>(context).getUserData();
    // BlocProvider.of<PostCubit>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = PostCubit.get(context);

    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: Colors.transparent,
          // ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    flex: 7,
                    child: CustomTextField(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        showBottomSheetFilter(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Constant.primaryColor))),
                        child: const Icon(
                          FontAwesomeIcons.filter,
                          color: Constant.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              buildSizedBox(24),
              RowTextViewAll(
                text: 'New',
                posts: cubit.myHaveList,
              ),
              buildSizedBox(16),
              ListViewSomeProducts(
                  // posts: cubit.posts,
                  ),
              buildSizedBox(24),
              //TODO: replace this with my products
              // const RowTextViewAll(
              //   text: 'Recommendations',
              // ),
              // buildSizedBox(16),
              // const ListViewSomeProducts(),

              buildSizedBox(24),
              Text('Reviews',
                  style: Styles.textStyle14.copyWith(color: Colors.black)),
              buildSizedBox(4),
              const Text('Now you can see all users have high rate ',
                  style: Styles.textStyle14),
              buildSizedBox(16),
              const ListTileOfReviews(),
            ],
          ),
        );
      },
    );
  }

  SizedBox buildSizedBox(double h) {
    return SizedBox(
      height: h,
    );
  }

  void showBottomSheetFilter(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ShowModelBottomSheet();
      },
    );
  }
}
