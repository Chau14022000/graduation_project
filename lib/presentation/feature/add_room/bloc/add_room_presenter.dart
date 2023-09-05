import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/my_home/home/room_entities.dart';
import '../../../../domain/use_cases/room/add_room_use_case.dart';
import 'add_room_state.dart';

class AddRoomPresenter extends Cubit<AddRoomState> {
  AddRoomPresenter(
    this._addRoomUseCase, {
    @visibleForTesting AddRoomState? state,
  }) : super(
          state ?? AddRoomState.initial(),
        );

  final AddRoomUseCase _addRoomUseCase;
  TextEditingController nameRoomTextEditingController = TextEditingController();

  void initState() {}

  void changeRoomSelector(RoomEntities room) {
    final list = <RoomEntities>[];
    state.listRoom.map(
      (e) {
        e.status = false;
        list.add(e);
      },
    ).toList();
    room.status = true;
    emit(
      state.copyWith(
        roomSelector: room,
        listRoom: list,
      ),
    );
  }

  Future<void> addRoom() async {
    final room = RoomEntities(
      icon: state.roomSelector.icon,
      nameRoom: nameRoomTextEditingController.text,
    );
    await _addRoomUseCase.run(room);
  }
}
