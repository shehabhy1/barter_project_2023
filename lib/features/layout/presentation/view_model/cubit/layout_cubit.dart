import 'package:barter_app/core/utils/assets.dart';
import 'package:barter_app/features/layout/presentation/views/home_screen.dart';
import 'package:barter_app/features/profile_screen/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../views/add_view.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currnetIndex = 0;

  List<Widget> bottomScreens = const [
    HomeView(),
    AddView(),
    // NotificationView(),
    ProfileView(),
  ];
  List<String> screensTitles = [
    'Home',
    'Add',
    // 'Notification',
    'Profile',
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AssetData.homeIcon,
          width: 32,
          height: 32,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AssetData.addIcon,
          width: 32,
          height: 32,
        ),
        label: ''),
    // BottomNavigationBarItem(
    //     icon: SvgPicture.asset(
    //       AssetData.notificationIcon,
    //       width: 32,
    //       height: 32,
    //     ),
    //     label: ''),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AssetData.profilIcon,
          width: 32,
          height: 32,
        ),
        label: ''),
  ];
  void changeIndexOfBottomNavBar(index) {
    if (index != currnetIndex) {
      currnetIndex = index;
      emit(LayoutChangeBottomNavState());
    }
  }

  void navigatTOHome() {
    currnetIndex = 0;
    emit(NavigatTOHomeState());
  }
}
