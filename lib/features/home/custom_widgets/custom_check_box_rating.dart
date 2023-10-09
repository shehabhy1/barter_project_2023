import 'package:barter_project_2023/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxRating extends StatefulWidget {
  final int itemCount;
  final ValueChanged<bool>? onChanged;

  const CustomCheckBoxRating({
    Key? key,
    required this.itemCount,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckBoxRatingState createState() => _CustomCheckBoxRatingState();
}

class _CustomCheckBoxRatingState extends State<CustomCheckBoxRating> {
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
          SizedBox(
            width: 100,
            height: 24,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Constant.primaryColor,
                    size: 16,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 4,
                  );
                },
                itemCount: widget.itemCount),
          )
        ],
      ),
    );
  }
}
