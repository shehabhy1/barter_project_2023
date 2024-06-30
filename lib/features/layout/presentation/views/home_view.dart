import 'package:barter_app/features/home/presentation/view_model.dart/cubit/home_cubit.dart';
import 'package:barter_app/features/home/presentation/view/widgetes/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    //to get data when open app
    // if (context.read<HomeCubit>().products.isEmpty) {
    context.read<HomeCubit>().getAllProducts();
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
      floatingActionButton: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetProductsLoadingFromPaginationState) {
            return const Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: LinearProgressIndicator());
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  // to save data state when navigation
  bool get wantKeepAlive => true;
}
