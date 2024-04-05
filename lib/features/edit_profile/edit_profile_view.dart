import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/shared_widget/custom_loading_indicator.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_cubit.dart';
import 'package:barter_app/features/profile_screen/presentation/model_view/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../../core/shared_widget/build_app_bar.dart';
import 'widgets/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getMyInfo(),
      child: Scaffold(
        appBar:
            buildAppBar(title: "Edit Profile", onPressed: () => context.pop()),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is GetUserinfoSuccessState) {
              return EditProfileBody(user: state.userInfo);
            } else if (state is GetUserinfoLoadingState) {
              return const CustomLoadingIndicator();
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
