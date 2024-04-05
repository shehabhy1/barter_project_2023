class SittingModel {
  final String tittle;
  final String? subTitle;
  const SittingModel({required this.tittle, this.subTitle});
}

const List<SittingModel> sittingList = [
  SittingModel(tittle: 'Language'),
  SittingModel(tittle: 'Rating & feedback'),
  SittingModel(tittle: 'Help'),
  SittingModel(tittle: 'Version', subTitle: 'v1'),
];
