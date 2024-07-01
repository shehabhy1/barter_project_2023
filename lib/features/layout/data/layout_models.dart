import 'package:barter_app/features/layout/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/assets.dart';
import '../../profile_screen/presentation/views/profile_view.dart';
import '../../add_post/presentation/view/add_view.dart';

const List<String> iconList = [
  AssetData.homeIcon,
  AssetData.addIcon,
  AssetData.profilIcon,
];
const List<Widget> bottomScreens = [
  HomeView(),
  AddView(),
  ProfileView(),
];
const List<String> screensTitles = [
  'Home',
  'Add',
  // 'Notification',
  'Profile',
];
