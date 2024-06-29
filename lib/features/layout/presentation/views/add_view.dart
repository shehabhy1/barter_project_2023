import 'package:barter_app/features/add%20post/presentation/view/view_model/cubit/post_cubit.dart';
import 'package:barter_app/features/add%20post/presentation/view/widgets/add_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Enter the item to swap it'),
      ),
      body: BlocProvider(
        create: (context) => PostCubit(),
        child: const AddViewBody(),
      ),
    );
  }
}
