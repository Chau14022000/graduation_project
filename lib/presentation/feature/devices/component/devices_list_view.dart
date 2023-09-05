import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/devices_presenter.dart';
import '../bloc/devices_state.dart';
import 'item_device.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({
    required this.devicesPresenter,
    Key? key,
  }) : super(key: key);

  final DevicesPresenter devicesPresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesPresenter, DevicesState>(
      bloc: devicesPresenter,
      buildWhen: (previous, current) =>
          !listEquals(previous.listDevices, current.listDevices),
      builder: (context, state) => ListView.builder(
        itemCount: state.listDevices.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            devicesPresenter.selectDevice(
              state.listDevices[index],
            );
          },
          child: ItemDevice(
            device: state.listDevices[index],
            presenter: devicesPresenter,
          ),
        ),
      ),
    );
  }
}
