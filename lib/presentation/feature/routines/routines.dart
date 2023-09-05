import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection/injector.dart';
import '../../base/base_page.dart';
import '../../resources/app_texts.dart';
import '../../routes/app_router.gr.dart';
import '../../widget/app_bar_widget.dart';
import 'bloc/routines_presenter.dart';
import 'bloc/routines_state.dart';
import 'component/routines_list_view.dart';
import 'component/routines_today_list_view.dart';

class Routines extends BasePage {
  const Routines({
    Key? key,
  }) : super(key: key);

  @override
  _RoutinesState createState() => _RoutinesState();
}

class _RoutinesState extends BasePageState<Routines> {
  final _routinesPresenter = injector.get<RoutinesPresenter>();

  @override
  int get length => 2;

  @override
  void onStateCreated() {
    _routinesPresenter.initState();
    super.onStateCreated();
  }

  @override
  Color? backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(130),
      child: BlocBuilder<RoutinesPresenter, RoutinesState>(
        bloc: _routinesPresenter,
        buildWhen: (previous, current) => previous.image != current.image,
        builder: (context, state) {
          return AppBarWidget(
            title: AppTexts.routines,
            width: 190,
            avatar: _routinesPresenter.state.image,
            textBottomOne: AppTexts.all,
            textBottomTwo: AppTexts.today,
            onTap: () async {
              final result = await AutoRouter.of(context).push(
                CreateRoutinesRoute(),
              );
              if (result == true) {
                await _routinesPresenter.initState();
              }
            },
            onTapIndex: (index) {},
          );
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return TabBarView(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: RoutinesListView(
                routinePresenter: _routinesPresenter,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: RoutinesTodayListView(
                routinePresenter: _routinesPresenter,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
