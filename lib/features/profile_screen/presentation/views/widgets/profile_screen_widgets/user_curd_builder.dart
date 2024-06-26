import 'package:barter_app/core/shared_widget/custom_shimmer.dart';
import 'package:barter_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared_widget/custom_cached_image.dart';
import '../../../model_view/cubit/get_user_cubit.dart';
import '../../../model_view/cubit/get_user_state.dart';

class UserCardBuilder extends StatelessWidget {
  const UserCardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit, GetProfileState>(
      builder: (context, state) {
        if (state is GetUserinfoSuccessState) {
          return ListTile(
            leading: CustomCachedNetworkImage(
              width: 50,
              height: 50,
              radius: 50,
              imageUrl: state.userInfo.data!.image!.url!,
            ),
            title: Text(
              state.userInfo.data!.name!,
              style:
                  AppStyles.medium24.copyWith(color: const Color(0xffB73BFF)),
            ),
          );
        } else if (state is GetUserinfoLoadingState) {
          return const CustomShimmer(
            height: 70,
            width: double.infinity,
            radius: 30,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
