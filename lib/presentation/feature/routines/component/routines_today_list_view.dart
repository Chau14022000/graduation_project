import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/routines_presenter.dart';
import '../bloc/routines_state.dart';
import 'item_routines_today.dart';

class RoutinesTodayListView extends StatelessWidget {
  const RoutinesTodayListView({
    required this.routinePresenter,
    Key? key,
  }) : super(key: key);

  final RoutinesPresenter routinePresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutinesPresenter, RoutinesState>(
      bloc: routinePresenter,
      buildWhen: (previous, current) =>
          !listEquals(previous.listRoutinesToday, current.listRoutinesToday),
      builder: (context, state) => ListView.builder(
        itemCount: state.listRoutinesToday.length,
        itemBuilder: (context, index) => Dismissible(
          key: Key(state.listRoutinesToday[index].id!),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (v) {
            routinePresenter.removeRoutine(
              state.listRoutinesToday[index],
            );
          },
          child: ItemRoutinesToday(
            routines: state.listRoutinesToday[index],
            presenter: routinePresenter,
          ),
        ),
      ),
    );
  }
}
