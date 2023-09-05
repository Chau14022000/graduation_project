import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection/injector.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../../resources/app_texts.dart';
import '../../../routes/app_router.gr.dart';
import '../bloc/splash_presenter.dart';
import '../bloc/splash_state.dart';
import 'indicator.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    Key? key,
  }) : super(key: key);

  final _splashPresenter = injector.get<SplashPresenter>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashPresenter, SplashState>(
      bloc: _splashPresenter,
      buildWhen: (previous, current) =>
          previous.pageCurrent != current.pageCurrent,
      builder: (context, state) => _splashPresenter.state.pageCurrent !=
              _splashPresenter.listPage.length - 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => _splashPresenter.onTapSkip(),
                  child: const Text(
                    AppTexts.skip,
                    style: AppTextStyles.size11GreyBold,
                  ),
                ),
                Indicator(
                  pageCurrent: _splashPresenter.state.pageCurrent,
                  splashPresenter: _splashPresenter,
                ),
                GestureDetector(
                  onTap: () => _splashPresenter.onTapNext(),
                  child: const Text(
                    AppTexts.next,
                    style: AppTextStyles.size13MainBold,
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(
                        const LoginRoute(),
                      );
                    },
                    child: const Text(
                      AppTexts.letStart,
                      style: AppTextStyles.size13MainBold,
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  child: GestureDetector(
                    onTap: () {
                      if (_splashPresenter.checkAccount()) {
                        AutoRouter.of(context).push(
                          const MyHomeRoute(),
                        );
                      } else {
                        AutoRouter.of(context).push(
                          const LoginRoute(),
                        );
                      }
                    },
                    child: const Icon(
                      Icons.chevron_right_outlined,
                      color: AppColors.main,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
