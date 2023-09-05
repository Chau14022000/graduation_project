import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../presentation/resources/app_images.dart';
import '../../../presentation/resources/app_texts.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageEntities {
  const PageEntities({
    required this.image,
    required this.mainText,
    required this.subText,
  });

  final String image;

  final String mainText;

  final String subText;
}

final List<PageEntities> listPageSplash = [
  const PageEntities(
    image: AppImages.pageOneSplash,
    mainText: AppTexts.mainPageOneSplash,
    subText: AppTexts.subPageOneSplash,
  ),
  const PageEntities(
    image: AppImages.pageTwoSplash,
    mainText: AppTexts.mainPageTwoSplash,
    subText: AppTexts.subPageTwoSplash,
  ),
  const PageEntities(
    image: AppImages.pageThreeSplash,
    mainText: AppTexts.mainPageThreeSplash,
    subText: AppTexts.subPageThreeSplash,
  )
];
