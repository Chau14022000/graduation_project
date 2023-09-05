import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/device_presenter.dart';
import '../bloc/device_state.dart';

class RoomFormField extends StatelessWidget {
  const RoomFormField({
    required this.devicePresenter,
    Key? key,
  }) : super(key: key);

  final DevicePresenter devicePresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicePresenter, DeviceState>(
      bloc: devicePresenter,
      buildWhen: (previous, current) =>
          previous.dropdownValue != current.dropdownValue,
      builder: (context, state) => DropdownButton<String>(
        value: state.dropdownValue,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
          size: 25,
          color: Colors.black,
        ),
        style: const TextStyle(
          color: Colors.black,
        ),
        dropdownColor: Colors.white,
        onChanged: (value) {
          if (value != null) {
            devicePresenter.changeRoomSelector(value);
          }
        },
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        underline: const Divider(
          color: Colors.transparent,
        ),
        items: devicePresenter.rooms.values
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
      ),
    );
  }
}
