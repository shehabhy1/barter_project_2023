import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';

class RowTextViewAll extends StatelessWidget {
  const RowTextViewAll({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Styles.textStyle20),
        TextButton(
          onPressed: () {
            context.pushNamed(AppRouter.kHomeAllView);
          },
          child: Text('View all',
              style: Styles.textStyle14.copyWith(color: Constant.primaryColor)),
        ),
      ],
    );
  }
}
