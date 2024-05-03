import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../../../profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import '../../../profile_screen/presentation/model_view/cubit/profile_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetUserinfoSuccessState) {
            return Center(
                child: Text(
              state.userInfo.data!.name!,
              style: AppStyles.medium24,
            ));
          } else {
            return const Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }
}
