import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/features/layout/presentation/view_model/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/layout_models.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.cubit});
  final LayoutCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: cubit.selectedIndex,
      items: List.generate(
        iconList.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconList[index],
            color: index == cubit.selectedIndex
                ? AppConstants.primaryColor
                : Colors.grey,
            width: index == cubit.selectedIndex ? 35.w : 30.w,
          ),
          label: '',
        ),
      ),
      onTap: (index) {
        cubit.changeIndexOfNavBar(index);
      },
    );
  }
}
