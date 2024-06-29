import 'package:barter_app/features/home/presentation/view/widgetes/product_item.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/shimmer_loading.dart';
import 'package:barter_app/features/home/presentation/view_model.dart/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetAllProductsSuccessState) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<HomeCubit>().getAllProducts();
            },
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:
                    0.7, // Adjust the height/width ratio of the cards
              ),
              itemBuilder: (context, index) {
                return ProductItem(
                  product: state.products[index],
                );
              },
            ),
          );
        } else if (state is GetAllProductsErrorState) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const ShimmerGridView();
        }
      },
    );
  }
}
