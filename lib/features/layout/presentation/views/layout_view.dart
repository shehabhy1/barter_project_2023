import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/layout_models.dart';
import '../view_model/cubit/layout_cubit.dart';
import 'widgets/bottom_nav.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LayoutCubit>();
    //to appear back button
    bool isHomeScreen = true;

    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if (cubit.selectedIndex == 0) {
          isHomeScreen = true;
        } else {
          isHomeScreen = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          //toggle between screens
          // appBar: AppBar(
          //   automaticallyImplyLeading: false,
          //   toolbarHeight: 50,
          //   centerTitle: true,
          //   // backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: isHomeScreen
          //       ? null
          //       : Padding(
          //           padding: const EdgeInsets.only(top: 10.0),
          //           child: IconButton(
          //             onPressed: () {
          //               cubit.navigatTOHome();
          //             },
          //             icon: const Icon(
          //               Icons.arrow_back_ios_outlined,
          //               color: Colors.black87,
          //             ),
          //           ),
          //         ),
          //   title: Text(
          //     cubit.screensTitles[cubit.currnetIndex],
          //     style: const TextStyle(
          //       height: 2,
          //       fontSize: 24,
          //       color: Colors.black,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          body: bottomScreens[cubit.selectedIndex],
          bottomNavigationBar: BottomNav(cubit: cubit),
        );
      },
    );
  }
}
