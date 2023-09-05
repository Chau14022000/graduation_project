import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/routines_presenter.dart';
import '../bloc/routines_state.dart';
import 'item_routines.dart';

class RoutinesListView extends StatelessWidget {
  const RoutinesListView({
    required this.routinePresenter,
    Key? key,
  }) : super(key: key);

  final RoutinesPresenter routinePresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutinesPresenter, RoutinesState>(
      bloc: routinePresenter,
      buildWhen: (previous, current) =>
          !listEquals(previous.listRoutines, current.listRoutines),
      builder: (context, state) => ListView.builder(
        itemCount: state.listRoutines.length,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Colors.red,
          ),
          key: Key(state.listRoutines[index].id!),
          onDismissed: (v) {
            routinePresenter.removeRoutine(
              state.listRoutines[index],
            );
          },
          child: ItemRoutines(
            routines: state.listRoutines[index],
            presenter: routinePresenter,
          ),
        ),
      ),
    );
  }
}
