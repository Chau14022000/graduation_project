import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_texts.dart';
import '../home/home.dart';
import '../routines/routines.dart';
import '../setting/setting.dart';
import 'bloc/my_home_presenter.dart';
import 'bloc/my_home_state.dart';

class MyHomePage extends BasePage {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends BasePageState<MyHomePage> {
  final _myHomePresenter = injector.get<MyHomePresenter>();
  final _widgetOptions = <Widget>[
    const Home(),
    const Routines(),
    const Setting(),
  ];
@override
  Future<bool> onWillPop() {
    SystemNavigator.pop();
    return super.onWillPop();
  }
  @override
  void onStateCreated() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    super.onStateCreated();
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<MyHomePresenter, MyHomeState>(
      bloc: _myHomePresenter,
      builder: (context, state) => Center(
        child: _widgetOptions.elementAt(
          _myHomePresenter.state.selectedIndex,
        ),
      ),
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    return BlocBuilder<MyHomePresenter, MyHomeState>(
      bloc: _myHomePresenter,
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: AppTexts.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.route,
            ),
            label: AppTexts.routines,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: AppTexts.setting,
          ),
        ],
        currentIndex: _myHomePresenter.state.selectedIndex,
        selectedItemColor: AppColors.main,
        onTap: (index) {
          _myHomePresenter.onTapIndex(index);
        },
      ),
    );
  }
}
