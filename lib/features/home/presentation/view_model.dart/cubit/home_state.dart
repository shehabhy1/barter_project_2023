part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetAllProductsSuccessState extends HomeState {
  final List<ProductModel> products;
  GetAllProductsSuccessState({required this.products});
}

final class GetAllProductsErrorState extends HomeState {
  final String error;
  GetAllProductsErrorState({required this.error});
}

final class GetAllProductsLoadingState extends HomeState {}
