import 'package:barter_project_2023/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../view_model/cubit/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);

    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if (state is NavigatToNotificationView) {
          context.pushNamed(AppRouter.routingNotificationScreen);
        } else {
          cubit.currnetIndex == 0;
        }
      },
      builder: (context, state) {
        return Scaffold(
          //toggle between screens
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              cubit.screensTitles[cubit.currnetIndex],
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: cubit.bottomScreens[cubit.currnetIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            items: cubit.bottomNavigationBarItems,
            currentIndex: cubit.currnetIndex,
            onTap: (int index) {
              cubit.changeIndexOfBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
