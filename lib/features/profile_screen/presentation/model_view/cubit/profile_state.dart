import 'package:barter_app/features/profile_screen/data/models/user_info_model.dart';

sealed class GetProfileState {}

final class ProfileInitial extends GetProfileState {}

final class GetUserinfoLoadingState extends GetProfileState {}

final class GetUserinfoSuccessState extends GetProfileState {
  final UserInfo userInfo;

  GetUserinfoSuccessState({required this.userInfo});
}

final class GetUserinfoErrorState extends GetProfileState {
  final String error;

  GetUserinfoErrorState({required this.error});
}
