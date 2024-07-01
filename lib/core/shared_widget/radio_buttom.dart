import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/features/add_post/presentation/view/view_model/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import '../../features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import '../utils/styles.dart';

class RadioCheck extends StatefulWidget {
  final RegisterCubit? registerCubit;
  final PostCubit? postCubit;
  final String text;
  final String tittleOne;
  final String tittleTwo;
  final bool isAddPost;

  const RadioCheck({
    super.key,
    required this.tittleOne,
    required this.tittleTwo,
    required this.text,
    this.isAddPost = false,
    this.registerCubit,
    this.postCubit,
  });

  @override
  State<RadioCheck> createState() => _RadioCheckState();
}

class _RadioCheckState extends State<RadioCheck> {
  int _selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: AppStyles.semiBold20,
        ),
        Row(
          children: [
            Radio(
              activeColor: AppColors.primaryColor,
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                });
                widget.isAddPost == true
                    ? widget.postCubit!.visability(true)
                    : widget.registerCubit!.gender = 'Male';
              },
            ),
            const SizedBox(width: 5),
            Text(
              widget.tittleOne,
              style: AppStyles.regularGrey16,
            ),
          ],
        ),
        const SizedBox(width: 15),
        Row(
          children: [
            Radio(
              activeColor: AppColors.primaryColor,
              value: 2,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value as int;
                });
                widget.isAddPost == true
                    ? widget.postCubit!.visability(false)
                    : widget.registerCubit!.gender = 'Female';
              },
            ),
            const SizedBox(width: 5),
            Text(
              widget.tittleTwo,
              style: AppStyles.regularGrey16,
            ),
          ],
        ),
      ],
    );
  }
}
