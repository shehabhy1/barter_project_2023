import 'package:barter_app/features/home/data/models/home_response_model.dart';
import 'package:barter_app/features/home/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  HomeRepo homeRepo;
  List<ProductModel> products = [];
  Future<void> getAllProducts() async {
    products = [];
    emit(GetAllProductsLoadingState());
    final result = await homeRepo.getAllProducts();
    result.fold(
      (error) => emit(GetAllProductsErrorState(error: error)),
      (response) {
        products = response.data!;
        emit(GetAllProductsSuccessState(products: response.data!));
      },
    );
  }
}
