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

    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: cubit.selectedIndex,
            children: bottomScreens,
          ),
          bottomNavigationBar: BottomNav(cubit: cubit),
        );
      },
    );
  }
}
