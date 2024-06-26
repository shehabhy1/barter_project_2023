sealed class UpdateUserStatus {
  const UpdateUserStatus();
}

final class EditUserInitial extends UpdateUserStatus {}

final class EditUserLoadingState extends UpdateUserStatus {}

final class EditUserSuccessState extends UpdateUserStatus {
  final String message;
  const EditUserSuccessState({required this.message});
}

final class EditUserErrorState extends UpdateUserStatus {
  final String error;
  const EditUserErrorState({required this.error});
}
