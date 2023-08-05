import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/utils/styles.dart';
import 'package:barter_project_2023/features/home/presentation/view/widgets/list_tile_reviews.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../generted/assets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Headphones',
          style: Styles.textStyle24.copyWith(
            letterSpacing: 0.04,
          )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: PageView.builder(
                  itemBuilder: (context , index) {
                    return  Image.asset(Assets.imagesImg);
                  },
                itemCount: 3,
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              axisDirection: Axis.horizontal,
              effect:  const SlideEffect(
                  spacing:  8.0,
                  radius:  6.0,
                  dotWidth:  12.0,
                  dotHeight:  12.0,
                  paintStyle:  PaintingStyle.stroke,
                  strokeWidth:  1.5,
                  dotColor:  Colors.grey,
                  activeDotColor:  Constant.primaryColor
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const ListTileOfReviews(),
            const SizedBox(
              height: 12,
            ),
            const Card(
              color: Colors.grey,
              child: ListTile(
                title: Text(
                  'Description',
                  style: Styles.textStyle16
                ),
                subtitle: Text(
                  'Bluetooth 5.0 technology Supports wireless charging Touch control feature',
                  style: Styles.textStyle14
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Card(
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quality',
                      style: Styles.textStyle16
                    ),
                    Text(
                      'High',
                      style: Styles.textStyle14
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Location',
                style: Styles.textStyle16
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Image.asset(Assets.imagesMap),
          ],
        ),
      ),
    );
  }
}
