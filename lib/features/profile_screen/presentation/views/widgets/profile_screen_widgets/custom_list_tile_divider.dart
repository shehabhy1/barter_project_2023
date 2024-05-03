import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:barter_app/core/shared_widget/warning_dialog.dart';
import 'package:barter_app/core/helper/cash_helper/cache_helper.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/helper/cash_helper/cash_helper_constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../data/models/profile_model.dart';

class CustomListTileDivider extends StatelessWidget {
  final ProfileModel model;
  const CustomListTileDivider({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () async {
            if (model.color != null) {
              AppWarning.logoutDialog(
                context: context,
                tittle: 'Do you want to logout?',
                onTap: () {
                  context.pop();
                  CachHelper.removeData(key: CashConstants.userToken);
                  context.pushNamedAndRemoveUntil(Routes.loginView,
                      predicate: (route) => false);
                },
              );
            } else {
              context.pushNamed(model.tittle);
            }
          },
          minVerticalPadding: 15,
          title: Text(
            model.tittle,
            style: AppStyles.medium18.copyWith(color: model.color),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 25),
        ),
        const Divider(height: 1, thickness: 0.3),
      ],
    );
  }
}
