import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:barter_app/features/home/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  List<ProductModel> products = [];
  int pageNum = 1;
  bool isLoading = false;

  Future<void> getAllProducts({bool fromPagination = false}) async {
    if (isLoading) return;
    isLoading = true;

    if (fromPagination) {
      emit(GetProductsLoadingFromPaginationState());
    } else {
      emit(GetProductsLoadingState());
    }

    final result = await homeRepo.getAllProducts(pageNum: pageNum);
    result.fold(
      (error) {
        isLoading = false;
        emit(GetProductsErrorState(error: error));
      },
      (response) {
        if (response.data!.isNotEmpty && response.results != 0) {
          pageNum++;
          if (fromPagination) {
            products.addAll(response.data!);
          } else {
            // first time
            products = response.data!;
          }
          emit(GetProductsSuccessState(products: products));
        } else if (response.data!.isEmpty && response.results == 0) {
          emit(NoMoreProductsState());
        }
        isLoading = false;
      },
    );
  }
}
