import 'package:flutter/material.dart';
import '../../../core/helper/cash_helper/cache_helper.dart';
import '../../../core/helper/cash_helper/cash_helper_constants.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/utils/styles.dart';
import '../view_model/update_user_cubit/update_user_cubit.dart';
import 'cusomt_list_tile_profile.dart';

class EditUserForm extends StatelessWidget {
  final UpdateUserCubit cubit;
  const EditUserForm({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(5),
        Text(
          CashHelper.getData(key: CashConstants.userName),
          textAlign: TextAlign.center,
          style: AppStyles.medium24.copyWith(fontWeight: FontWeight.w400),
        ),
        verticalSpace(20),
        CustomListTileProfile(
          title: 'Name',
          subTitle: CashHelper.getData(key: CashConstants.userName),
          controller: cubit.nameController,
        ),
        // CustomListTileProfile(
        //   title: 'Password',
        //   subTitle: '**********',
        //   controller: cubit.passwordController,
        // ),
        CustomListTileProfile(
          title: 'Phone Number',
          subTitle: CashHelper.getData(key: CashConstants.userPhone),
          controller: cubit.phoneController,
        ),
        CustomListTileProfile(
          title: 'WhatsApp Number',
          subTitle: CashHelper.getData(key: CashConstants.userWhatsApp),
          controller: cubit.whatsAppController,
        ),
        verticalSpace(50),
      ],
    );
  }
}
