import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_room_presenter.dart';
import '../bloc/add_room_state.dart';
import 'item_room.dart';

class RoomGripView extends StatelessWidget {
  const RoomGripView({
    required this.addRoomPresenter,
    Key? key,
  }) : super(key: key);

  final AddRoomPresenter addRoomPresenter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRoomPresenter, AddRoomState>(
      buildWhen: (previous, current) =>
          previous.roomSelector != current.roomSelector,
      bloc: addRoomPresenter,
      builder: (context, state) => GridView.count(
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(
          state.listRoom.length,
          (index) => GestureDetector(
            onTap: () => addRoomPresenter.changeRoomSelector(
              state.listRoom[index],
            ),
            child: ItemRoom(
              room: state.listRoom[index],
            ),
          ),
        ),
      ),
    );
  }
}
