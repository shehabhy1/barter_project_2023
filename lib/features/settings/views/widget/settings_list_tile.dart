import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';

class SettingsListTile extends StatelessWidget {
  final void Function()? onTap;
  final String tittle;
  final Widget? subTittle;
  final bool icon;

  const SettingsListTile({
    super.key,
    this.onTap,
    required this.tittle,
    this.subTittle,
    this.icon = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      //contentPadding: EdgeInsets.zero,
      title: Text(
        tittle,
        style: AppStyles.medium18,
      ),
      subtitle: subTittle,
      trailing: icon == true
          ? const Icon(Icons.arrow_forward_ios_outlined, size: 25)
          : null,
    );
  }
}
