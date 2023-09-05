import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../../domain/entities/my_home/home/device_response_entities.dart';
import '../../../../../domain/entities/my_home/home/room_entities.dart';
import '../../../../../domain/use_cases/device/add_device_use_case.dart';
import 'add_device_to_room_state.dart';

class AddDeviceToRoomPresenter extends Cubit<AddDeviceToRoomState> {
  AddDeviceToRoomPresenter(
    this._getAccountUseCase,
    this._addDevicesUseCase, {
    @visibleForTesting AddDeviceToRoomState? state,
  }) : super(state ?? AddDeviceToRoomState.initial());

  final GetAccountUseCase _getAccountUseCase;
  final AddDevicesUseCase _addDevicesUseCase;

  int indexSelector = 0;

  Future<void> onStateCreated() async {
    final user = await _getAccountUseCase.run();
    emit(
      state.copyWith(
        listRoom: user.rooms ?? [],
      ),
    );
  }

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
      ),
    );
  }

  Future<void> addDevice(String idDevice) async {
    await _addDevicesUseCase.run(
      DeviceResponseEntities(
        idDevice: idDevice,
        room: state.roomSelector.id ?? '',
      ),
    );
  }
}
