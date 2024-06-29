part of 'post_cubit.dart';

sealed class PostState {}

final class PostCubitInitial extends PostState {}
final class ChosenImageSuccessfullyState extends PostState {}
final class ChosenImageErrorState extends PostState {}
final class RemoveImageSuccessfullyState extends PostState {}
