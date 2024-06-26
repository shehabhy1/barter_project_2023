import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import '../../features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import '../utils/styles.dart';

class CheckButtom extends StatefulWidget {
  final String text;
  final RegisterCubit? cubit;

  const CheckButtom({super.key, required this.text, this.cubit});

  @override
  State<CheckButtom> createState() => _CheckButtomState();
}

class _CheckButtomState extends State<CheckButtom> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ), // Set your desired border radius here
          ),
          value: isChecked,
          activeColor: AppColors.primaryColor,
          onChanged: (newBool) {
            setState(() {
              isChecked = newBool!;
              widget.cubit?.isChecked = isChecked;
              debugPrint(widget.cubit?.isChecked.toString());
            });
          },
        ),
        Text(
          widget.text,
          style: AppStyles.semiBold20.copyWith(
            fontSize: 14,
            color: const Color(0xFF8B8B8B),
          ),
        ),
      ],
    );
  }
}
