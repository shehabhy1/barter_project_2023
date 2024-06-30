import 'package:barter_app/core/shared_widget/warning_dialog.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/product_item.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/shimmer_loading.dart';
import 'package:barter_app/features/home/presentation/view_model.dart/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetProductsErrorState) {
          AppWarning.snackBarState(context, state.error);
        } else if (state is NoMoreProductsState) {
          AppWarning.snackBarState(context, 'No more products available');
        }
      },
      buildWhen: (previous, current) =>
          current is! GetProductsLoadingFromPaginationState &&
          current is! NoMoreProductsState,
      builder: (context, state) {
        if (state is GetProductsSuccessState) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification) {
                context.read<HomeCubit>().getAllProducts(fromPagination: true);
              }
              return true;
            },
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<HomeCubit>().pageNum = 1; // Reset page number
                context
                    .read<HomeCubit>()
                    .products
                    .clear(); // Clear products list
                await context.read<HomeCubit>().getAllProducts();
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: context.read<HomeCubit>().products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      0.7, // Adjust the height/width ratio of the cards
                ),
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: context.read<HomeCubit>().products[index],
                  );
                },
              ),
            ),
          );
        } else {
          return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeCubit>().getAllProducts();
              },
              child: const ShimmerGridView());
        }
      },
    );
  }
}
