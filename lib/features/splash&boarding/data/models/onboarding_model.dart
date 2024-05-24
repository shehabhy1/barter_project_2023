import '../../../../core/utils/assets.dart';

class OnBoardingModel {
  final String? image;
  final String? description;

  const OnBoardingModel({this.image, this.description});
}

const String onBoardingDescription =
    'where you can exchange goods and services with ease. Let our app connect you with a community of like-minded individuals and open up a world of possibilities!';

const List<OnBoardingModel> screens = [
  OnBoardingModel(
    image: AssetData.onboardingImage1,
    description: onBoardingDescription,
  ),
  OnBoardingModel(image: AssetData.onboardingImage2),
];
