import 'package:barter_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/assets.dart';
import '../../profile_screen/presentation/views/profile_view.dart';
import '../../add_post/presentation/view/add_view.dart';

const List<String> iconList = [
  AssetData.homeIcon,
  AssetData.addIcon,
  AssetData.profilIcon,
];
List<Widget> bottomScreens = [
  const HomeView(),
  const AddView(),
  const ProfileView(),
];
const List<String> screensTitles = [
  'Home',
  'Add',
  // 'Notification',
  'Profile',
];
