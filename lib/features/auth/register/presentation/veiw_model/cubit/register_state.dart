sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class ChosenImageSuccessfullyState extends RegisterState {}

final class UploadProfilePic extends RegisterState {}

final class ChosenImageErrorState extends RegisterState {}

final class RemoveImageSuccessState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class ValidateMode extends RegisterState {}

final class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState({required this.error});
}
