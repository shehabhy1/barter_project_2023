import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/add%20post/data/model/post_model.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/list_tile_reviews.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/assets.dart';

class ProductDetails extends StatelessWidget {
  final PostModel postModel;
  const ProductDetails({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            //TODO: Navigat to Layout View => finished
            // context.go(AppRouter.kHomeView);
            context.pop();
          },
        ),
        title: Text('postModel.name',
            style: Styles.textStyle24.copyWith(
              letterSpacing: 0.04,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Image.asset('Assets.imagesImg');
                  // return Image.network(postModel.pic!);
                },
                itemCount: 3,
              ),
            ),
            PageIndicator(controller: controller),
            buildSizedBox(24),
            const ListTileOfReviews(),
            buildSizedBox(12),
            Card(
              color: Colors.grey,
              child: ListTile(
                title: const Text('Description', style: Styles.textStyle16),
                subtitle: Text(postModel.disc, style: Styles.textStyle14),
              ),
            ),
            buildSizedBox(20),
            const Card(
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Quality', style: Styles.textStyle16),
                    // TODO:not added in post model and add screen
                    Text('High', style: Styles.textStyle14),
                  ],
                ),
              ),
            ),
            buildSizedBox(12),
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Location', style: Styles.textStyle16),
            ),
            buildSizedBox(12),
            Image.asset(Assets.imagesMap),
          ],
        ),
      ),
    );
  }
}

SizedBox buildSizedBox(double h) {
  return SizedBox(
    height: h,
  );
}
