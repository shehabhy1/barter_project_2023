/* part of 'signup_auth_cubit.dart';


sealed class SignupAuthState {}

final class SignupAuthInitial extends SignupAuthState {}

final class SignupAuthLoading extends SignupAuthState {}

final class SignupAuthSuccess extends SignupAuthState {}

final class SignupAuthFailure extends SignupAuthState {
  final String errMessage;
  SignupAuthFailure({required this.errMessage});
}
 */