import 'package:barter_project_2023/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String text;
  final ValueChanged<bool>? onChanged;

  const CustomCheckBox({
    Key? key,
    required this.text,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          if (widget.onChanged != null) {
            widget.onChanged!(_isChecked);
          }
        });
      },
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: _isChecked ? Constant.primaryColor : Colors.transparent,
              border: Border.all(
                color: Constant.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: _isChecked
                ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            )
                : null,
          ),
          const SizedBox(width: 8),
          Text(widget.text),
        ],
      ),
    );
  }
}