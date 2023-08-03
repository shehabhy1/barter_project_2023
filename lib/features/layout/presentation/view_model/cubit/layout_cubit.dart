import 'package:barter_project_2023/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../notification/presentition/views/notification_screen.dart';
import '../../views/add_view.dart';
import '../../views/home_view.dart';
import '../../views/profile_view.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currnetIndex = 0;

  List<Widget> bottomScreens = const [
    HomeView(),
    AddView(),
    NotificationsScreen(),
    // NotificationView(),
    ProfileView(),
  ];
  List<String> screensTitles = [
    'Home',
    'Add',
    'Notification',
    'Profile',
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Image.asset(AssetData.homeIcon), label: ''),
    BottomNavigationBarItem(icon: Image.asset(AssetData.addIcon), label: ''),
    BottomNavigationBarItem(
        icon: Image.asset(AssetData.notificationIcon), label: ''),
    BottomNavigationBarItem(icon: Image.asset(AssetData.profilIcon), label: ''),
  ];
  void changeIndexOfBottomNavBar(index) {
    if (index == 2) {
      emit(NavigatToNotificationView());
    } else {
      currnetIndex = index;
      emit(LayoutChangeBottomNavState());
    }
  }
}
