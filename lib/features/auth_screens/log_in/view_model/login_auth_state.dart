part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class GetUSersSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String errMessage;
  AuthFailure({required this.errMessage});
}

final class LoginShowPasswordState extends AuthState {}

final class LoginShowNewPasswordState extends AuthState {}

final class LoginShowRepeatPasswordState extends AuthState {}

final class GetUserDataSuccess extends AuthState {}

final class GetUserDataError extends AuthState {
   final String error;

  GetUserDataError({required this.error});
}

final class GetUserDataLoading extends AuthState {}
final class ChosenImageSuccessfullyState extends AuthState {}
final class ChosenImageErrorState extends AuthState {}
