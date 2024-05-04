import 'package:barter_app/features/profile_screen/data/models/user_info_model.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetUserinfoLoadingState extends ProfileState {}

final class GetUserinfoSuccessState extends ProfileState {
  final UserInfo userInfo;

  GetUserinfoSuccessState({required this.userInfo});
}

final class GetUserinfoErrorState extends ProfileState {
  final String error;

  GetUserinfoErrorState({required this.error});
}
