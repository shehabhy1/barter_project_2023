import 'package:flutter/material.dart';
import '../../../core/utils/assets.dart';
import '../../profile_screen/presentation/views/profile_view.dart';
import '../presentation/views/add_view.dart';
import '../presentation/views/home_screen.dart';

const List<String> iconList = [
  AssetData.homeIcon,
  AssetData.addIcon,
  AssetData.profilIcon,
];
const List<Widget> bottomScreens = [
  HomeView(),
  AddView(),
  // NotificationView(),
  ProfileView(),
];
const List<String> screensTitles = [
  'Home',
  'Add',
  // 'Notification',
  'Profile',
];
