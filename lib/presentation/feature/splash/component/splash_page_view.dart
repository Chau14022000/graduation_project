import 'package:flutter/material.dart';

import '../../../../domain/entities/splash/page_entities.dart';
import '../../../resources/app_text_styles.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({
    required this.pageEntities,
    Key? key,
  }) : super(key: key);
  final PageEntities pageEntities;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pageEntities.image,
          ),
          const Spacer(),
          Text(
            pageEntities.mainText,
            style: AppTextStyles.size20MainTextBold,
          ),
          const SizedBox(height: 20),
          Text(
            pageEntities.subText,
            textAlign: TextAlign.center,
            style: AppTextStyles.size15Grey,
          ),
        ],
      ),
    );
  }
}
