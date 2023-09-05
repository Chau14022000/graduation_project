import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import '../bloc/splash_presenter.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    required this.pageCurrent,
    required this.splashPresenter,
    Key? key,
  }) : super(key: key);

  final int pageCurrent;
  final SplashPresenter splashPresenter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        splashPresenter.listPage.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(left: 9),
          height: 10,
          width: pageCurrent == index ? 48 : 24,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: pageCurrent == index ? AppColors.main : AppColors.grey,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
