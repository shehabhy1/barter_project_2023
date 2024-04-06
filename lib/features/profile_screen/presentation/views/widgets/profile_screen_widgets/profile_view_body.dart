import 'package:barter_app/features/profile_screen/data/models/profile_model.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_list_tile_divider.dart';
import 'user_curd_builder.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: () async {
            return await context.read<ProfileCubit>().getMyInfo();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserCardBuilder(),
              const SizedBox(height: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: profileList
                    .map((model) => CustomListTileDivider(model: model))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
