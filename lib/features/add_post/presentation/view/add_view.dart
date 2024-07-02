import 'package:barter_app/features/add_post/presentation/view/widgets/add_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/pick_image_cubit/pick_image_cubit.dart';
import 'view_model/cubit/post_cubit.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<PostCubit>()),
        BlocProvider(create: (context) => getIt<PickImageCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.white,
          centerTitle: true,
          title: const Text('Enter the item to swap it'),
        ),
        body: const AddViewBody(),
      ),
    );
  }
}
