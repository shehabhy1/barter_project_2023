import 'package:barter_app/features/sitting/data/model/sitting_model.dart';
import 'package:flutter/material.dart';
import 'sitting_list_tile.dart';

class SittingViewBody extends StatelessWidget {
  const SittingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            sittingList.map((model) => SittingListTile(model: model)).toList(),
      ),
    );
  }
}
