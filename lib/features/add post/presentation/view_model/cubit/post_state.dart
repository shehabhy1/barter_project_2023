part of 'post_cubit.dart';

@immutable
sealed class PostState {
  const PostState();
}

final class PostInitial extends PostState {}

final class AddPostLoading extends PostState {}

final class AddPostSuccess extends PostState {}

final class AddPostFailure extends PostState {}

final class GetPostLoading extends PostState {}
final class ChosenPostImageSuccessfullyState extends PostState {}
final class ChosenPostImageErrorState extends PostState {}

final class GetPostSuccess extends PostState {
  final List<PostModel> posts;

  const GetPostSuccess({required this.posts});
}

final class GetPostFailure extends PostState {
  final String error;

  const GetPostFailure({required this.error});
}
