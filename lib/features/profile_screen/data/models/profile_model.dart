import 'package:flutter/material.dart';

class ProfileModel {
  final String tittle;
  final Color? color;
  const ProfileModel({required this.tittle, this.color});
}

const List<ProfileModel> profileList = [
  ProfileModel(tittle: 'Profile info'),
  ProfileModel(tittle: 'Have & need'),
  ProfileModel(tittle: 'Deal status'),
  ProfileModel(tittle: 'Settings'),
  ProfileModel(tittle: 'All Reports'),
  ProfileModel(tittle: 'Submit Report'),
  ProfileModel(tittle: 'Logout', color: Colors.red),
];
