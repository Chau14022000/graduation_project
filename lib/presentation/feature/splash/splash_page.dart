import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../routes/app_router.gr.dart';
import 'bloc/splash_presenter.dart';
import 'bloc/splash_state.dart';
import 'component/bottom_bar.dart';
import 'component/splash_page_view.dart';

class SplashPage extends BasePage {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage> {
  final _splashPresenter = injector.get<SplashPresenter>();

  @override
  void onStateCreated() {
    if (_splashPresenter.checkAccount()) {
      AutoRouter.of(context).push(
        const MyHomeRoute(),
      );
      super.onStateCreated();
    }
  }

  @override
  Widget buildBody(BuildContext context) =>
      BlocConsumer<SplashPresenter, SplashState>(
        bloc: _splashPresenter,
        listener: (context, state) {},
        listenWhen: (previous, current) =>
            previous.pageController != current.pageController,
        builder: (context, state) => Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: state.pageController,
                onPageChanged: (value) =>
                    _splashPresenter.changePageCurrent(value),
                itemCount: _splashPresenter.listPage.length,
                itemBuilder: (context, index) => SplashPageView(
                  pageEntities: _splashPresenter.listPage[index],
                ),
              ),
            ),
            const SizedBox(height: 100),
            BottomBar(),
            const SizedBox(height: 20),
          ],
        ),
      );
}
