import 'package:flutter/material.dart';
import 'package:barter_app/features/sitting/data/model/sitting_model.dart';
import '../../../../core/utils/styles.dart';

class SittingListTile extends StatelessWidget {
  final SittingModel model;
  const SittingListTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // if (model.color != null) {
        //   AppWarning.logoutDialog(
        //     context: context,
        //     tittle: 'Do you want to logout?',
        //     onTap: () {},
        //   );
        // } else {
        //   context.pushNamed(model.tittle);
        // }
      },
      contentPadding: EdgeInsets.zero,
      title: Text(
        model.tittle,
        style: AppStyles.medium18,
      ),
      trailing: const Icon(Icons.keyboard_arrow_right_sharp, size: 30),
    );
  }
}
