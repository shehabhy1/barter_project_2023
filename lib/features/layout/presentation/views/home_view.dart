import 'package:barter_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/helper/spacing.dart';

import '../../../../core/utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.transparent,
        ),
        body: const SafeArea(
          child: HomeViewBody(),
        ));
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7, // Adjust the height/width ratio of the cards
      ),
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/img_1.png',
                width: double.infinity,
                height: context.deviceHeight * 0.12,
              ),
            ),
            verticalSpace(20),
            Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?w=130&h=195&c=7&r=0&o=5&pid=1.7',
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text('Mohmaed Gehad',
                            style: AppStyles.medium16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        'A power bank is a portable device designed to recharge your electronic devices on the go. It serves as an external battery pack that can store electrical energy to charge various gadgets like smartphones, tablets, laptops, and other USB-powered devices when access to a standard power outlet is unavailable.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.regularGrey14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  context.pushNamed(Routes.productDetailsView);
                },
                child: const Text(
                  'Discover',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
// https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?w=130&h=195&c=7&r=0&o=5&pid=1.7