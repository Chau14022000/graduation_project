import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_routines_presenter.dart';
import '../bloc/create_routines_state.dart';
import 'item_device.dart';

class DeviceListView extends StatelessWidget {
  const DeviceListView({
    required this.createRoutinesPresenter,
    Key? key,
  }) : super(key: key);

  final CreateRoutinesPresenter createRoutinesPresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRoutinesPresenter, CreateRoutinesState>(
      bloc: createRoutinesPresenter,
      buildWhen: (previous, current) => !listEquals(
        previous.listDevice,
        current.listDevice,
      ),
      builder: (context, state) => ListView.builder(
        itemCount: state.listDevice.length,
        itemBuilder: (context, index) {
          var temp = true;
          if (createRoutinesPresenter.state.onOffDevice.isEmpty) {
            temp = true;
          } else {
            temp = createRoutinesPresenter.state.onOffDevice[index];
          }
          return Dismissible(
            key: Key(state.listDevice[index]!.id),
            onDismissed: (v) {
              createRoutinesPresenter.removeDevice(
                state.listDevice[index],
              );
            },
            child: ItemDevice(
              createRoutinesPresenter: createRoutinesPresenter,
              index: index,
              onOffRoutine: temp,
            ),
          );
        },
      ),
    );
  }
}
