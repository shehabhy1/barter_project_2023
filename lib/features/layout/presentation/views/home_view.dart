import 'package:barter_app/features/home/presentation/view_model.dart/cubit/home_cubit.dart';
import 'package:barter_app/features/layout/presentation/views/home_view_body.dart';
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
    context.read<HomeCubit>()..getAllProducts();
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
        ));
  }
}
