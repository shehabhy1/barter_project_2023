part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductsSuccessState extends HomeState {
  final List<ProductModel> products;
  GetProductsSuccessState({required this.products});
}

final class GetProductsErrorState extends HomeState {
  final String error;
  GetProductsErrorState({required this.error});
}

final class GetProductsLoadingState extends HomeState {}

final class GetProductsLoadingFromPaginationState extends HomeState {}

final class NoMoreProductsState extends HomeState {}
