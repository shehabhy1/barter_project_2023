import 'package:barter_app/core/shared_widget/warning_dialog.dart';
import 'package:barter_app/features/profile_screen/data/models/profile_model.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/get_user_cubit.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/get_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_list_tile_divider.dart';
import 'user_curd_builder.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: RefreshIndicator(
        onRefresh: () async {
          return context.read<GetUserCubit>().getMyInfo();
        },
        child: BlocListener<GetUserCubit, GetProfileState>(
          listener: (context, state) {
            if (state is GetUserinfoErrorState) {
              AppWarning.snackBarState(context, state.error);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserCardBuilder(),
              const SizedBox(height: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: profileList
                    .map((model) => CustomListTileDivider(
                          model: model,
                          argu: context.read<GetUserCubit>().userData,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
