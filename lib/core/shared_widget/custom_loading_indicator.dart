import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
//import 'package:flutter/material.dart';

// void defaultCircularProgress({
//   required BuildContext context,
// }) {
//   showDialog(
//     context: context,
//     builder: (context) => const Center(
//       child: CircularProgressIndicator(
//           // color: ColorsManager.mainBlue,
//           ),
//     ),
//   );
// }
