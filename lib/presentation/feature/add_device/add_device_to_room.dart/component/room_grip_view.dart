import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_device_to_room_presenter.dart';
import '../bloc/add_device_to_room_state.dart';
import 'item_room.dart';

class RoomGripView extends StatelessWidget {
  const RoomGripView({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  final AddDeviceToRoomPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDeviceToRoomPresenter, AddDeviceToRoomState>(
      buildWhen: (previous, current) =>
          previous.roomSelector != current.roomSelector ||
          previous.listRoom != current.listRoom,
      bloc: presenter,
      builder: (context, state) => GridView.count(
        childAspectRatio: 1,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        children: List.generate(
          state.listRoom.length,
          (index) => GestureDetector(
            onTap: () {
              presenter.changeRoomSelector(
                state.listRoom[index],
              );
            },
            child: ItemRoom(
              room: state.listRoom[index],
            ),
          ),
        ),
      ),
    );
  }
}
