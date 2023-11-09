import 'package:barter_project_2023/features/deals_view/presentation/view/widgets/deal_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded ,
            color: Colors.black,),
        ),
        title:  Text(
          'Deals Details',
          style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600 ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
  body:  DetailsBody(),
    );
  }
}
