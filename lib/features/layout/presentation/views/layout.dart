import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cubit/layout_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          //toggle between screens
          body: cubit.bottomScreens[cubit.currnetIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            items: cubit.bottomNavigationBarItems,
            currentIndex: cubit.currnetIndex,
            onTap: (int index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
