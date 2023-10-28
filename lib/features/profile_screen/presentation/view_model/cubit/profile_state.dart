part of 'profile_cubit.dart';

@immutable
sealed class ProfileStates {}

final class ProfileInitialState extends ProfileStates {}

final class GetProfileDataSuccessState extends ProfileStates {}

final class GetProfileDataLoadingState extends ProfileStates {}

final class GetProfileDataErrorState extends ProfileStates {
  final String error;

  GetProfileDataErrorState({required this.error});
}

final class UpdateProfileDataSuccessState extends ProfileStates {}

final class UpdateProfileDataLoadingState extends ProfileStates {}

final class UpdateProfileDataErrorState extends ProfileStates {
  final String error;

  UpdateProfileDataErrorState({required this.error});
}
