import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem(
      {super.key,
      required this.index,
      required this.tabBarTitles,
      required this.currnetIndex});
  final int index;

  final int currnetIndex;
  final List<String> tabBarTitles;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 29.w,
      decoration: BoxDecoration(
          color: currnetIndex == index ? const Color(0xffB73BFF) : Colors.white,
          border: Border.all(
              color: currnetIndex == index ? Colors.white : Colors.black),
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Center(
          child: Text(
        tabBarTitles[index],
        style: TextStyle(
            color: currnetIndex == index ? Colors.white : Colors.black),
      )),
    );
  }
}
