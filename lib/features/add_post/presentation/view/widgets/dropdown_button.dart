import 'package:barter_app/core/helper/app_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> menuItems;
  const CustomDropdownButton({super.key, required this.menuItems});

  @override
  State<StatefulWidget> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _btn2SelectedVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.greyF8.withOpacity(0.6)),
      ),
      child: DropdownButton(
        isExpanded: true,
        dropdownColor: Colors.white,
        value: _btn2SelectedVal,
        hint: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text('Choose', style: AppStyles.regularGrey14),
        ),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _btn2SelectedVal = newValue);
          }
        },
        items: widget.menuItems
            .map(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        underline: const SizedBox(),
      ),
    );
  }
}
