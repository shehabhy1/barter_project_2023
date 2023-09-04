import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:barter_project_2023/features/profile_screen/views/screens/report_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home/presentation/view/home_view.dart';
import '../layout/presentation/views/add_view.dart';
import '../layout/presentation/views/profile_view.dart';
import '../notification/presentition/views/notification_screen.dart';

class UserLayout extends StatefulWidget {
  const UserLayout({Key? key}) : super(key: key);

  @override
  State<UserLayout> createState() => _UserLayoutState();
}

class _UserLayoutState extends State<UserLayout> {
  var currentIndex = 2;
  List<Widget> userScreens = [
    HomeView(),
    AddView(),
    NotificationsScreen(),
    ReportView(),
  ];
  List<String> title = [
    'Home',
    'add'
        'Notifications',
    'My account'
  ];
  int _currentIndex = 2;
  final List<IconData> _iconList = [
    Icons.home,
    Icons.add_comment_rounded,
    Icons.notifications,
    Icons.account_circle_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: userScreens[2 - _currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 70,
        splashRadius: 50,
        iconSize: 37,
        inactiveColor: Colors.white,
        activeColor: Colors.amber,
        backgroundColor: Color(0xff515281),
        splashColor: Colors.cyan,
        icons: _iconList,
        activeIndex: _currentIndex,
        splashSpeedInMilliseconds: 500,
        gapLocation: GapLocation.none,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        notchSmoothness: NotchSmoothness.defaultEdge,
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 15,
          spreadRadius: 0.7,
          color: Color(0xff515281),
        ),
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
