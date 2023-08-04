import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cubit/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    //to appear back button
    bool isHomeScreen = true;

    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if (cubit.currnetIndex == 2) {
          isHomeScreen = false;
        } else {
          isHomeScreen = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          //toggle between screens
          appBar: AppBar(
            toolbarHeight: 40,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: isHomeScreen
                ? null
                : Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: IconButton(
                      onPressed: () {
                        cubit.navigatTOHome();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.black87,
                      ),
                    ),
                  ),
            title: Text(
              cubit.screensTitles[cubit.currnetIndex],
              style: const TextStyle(
                  height: 2,
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: cubit.bottomScreens[cubit.currnetIndex],
          bottomNavigationBar: BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: Color(0xffB73BFF)),
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
