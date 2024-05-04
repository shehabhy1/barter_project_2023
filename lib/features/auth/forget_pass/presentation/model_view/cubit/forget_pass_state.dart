

sealed class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class ForgetPassLoadingState extends ForgetPassState {}

final class ForgetPassSuccessState extends ForgetPassState {}

final class ForgetPassErrorState extends ForgetPassState {
  final String error;

  ForgetPassErrorState({required this.error});
}

class VerifyResetCodeLoadingState extends ForgetPassState {}

class VerifyResetCodeSuccessState extends ForgetPassState {}

class VerifyResetCodeErrorState extends ForgetPassState {
  final String error;

  VerifyResetCodeErrorState({required this.error});
}

class ResetPasswordLoadingState extends ForgetPassState {}

class ResetPasswordSuccessState extends ForgetPassState {}

class ResetPasswordErrorState extends ForgetPassState {
  final String error;

  ResetPasswordErrorState({required this.error});
}
