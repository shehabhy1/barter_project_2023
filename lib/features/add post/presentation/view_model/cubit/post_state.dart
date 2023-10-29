part of 'post_cubit.dart';

@immutable
sealed class PostState {
  const PostState();
}

final class PostInitial extends PostState {}

final class AddPostLoading extends PostState {}

final class AddPostSuccess extends PostState {}

final class AddPostFailure extends PostState {
  final String error;

  const AddPostFailure({required this.error});
}

final class ChosenImageSuccessfullyState extends PostState {}

final class ChosenImageErrorState extends PostState {}

final class RemoveImageSuccessfullyState extends PostState {}

final class UploadImageLoadingState extends PostState {}

final class UploadImageSuccessState extends PostState {}

final class UploadImageErrorState extends PostState {
  final String error;

  const UploadImageErrorState({required this.error});
}

final class UploadPostErrorState extends PostState {
  final String error;

  const UploadPostErrorState({required this.error});
}

final class GetPostLoading extends PostState {}

final class GetPostSuccess extends PostState {}

final class GetPostFailure extends PostState {
  final String error;

  const GetPostFailure({required this.error});
}

final class GetAllPRoductsLoading extends PostState {}

final class GetAllPRoductsSuccess extends PostState {}

final class GetAllPRoductsFailure extends PostState {
  final String error;

  const GetAllPRoductsFailure({required this.error});
}

final class GetSpecPostLoading extends PostState {}

final class GetSpecPostSuccess extends PostState {}

final class GetSpecPostFailure extends PostState {
  final String error;

  const GetSpecPostFailure({required this.error});
}
