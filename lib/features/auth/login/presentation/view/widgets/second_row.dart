import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/helper/app_constants.dart';
import '../../../../../../core/shared_widget/check_button.dart';
import '../../../../../../core/utils/styles.dart';

class SecondRow extends StatelessWidget {
  const SecondRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CheckButtom(
          text: 'Remember me',
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.forgetPassView);
          },
          child: Text(
            'Forget password?',
            style: AppStyles.semiBold20
                .copyWith(fontSize: 14, color: AppConstants.primaryColor),
          ),
        ),
      ],
    );
  }
}
