import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/use_cases/device/update_state_device_use_case.dart';
import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../../domain/entities/my_home/home/room_entities.dart';
import '../../../../domain/entities/user/user_entities.dart';
import '../../../../domain/use_cases/device/stream_device_use_case.dart';
import '../../../../domain/use_cases/room/remove_room_use_case.dart';
import 'home_state.dart';

class HomePresenter extends Cubit<HomeState> {
  HomePresenter(
    this._streamDeviceUseCase,
    this._getAccountUseCase,
    this._updateStateDeviceUseCase,
    this._removeRoomUseCase, {
    @visibleForTesting HomeState? state,
  }) : super(state ?? HomeState.initial());

  final StreamDeviceUseCase _streamDeviceUseCase;
  final GetAccountUseCase _getAccountUseCase;
  final UpdateStateDeviceUseCase _updateStateDeviceUseCase;
  final RemoveRoomUseCase _removeRoomUseCase;
  final listDevice = <DeviceEntities>[];

  int indexSelector = 0;

  Future<void> initState() async {
    final user = await _getAccountUseCase.run();
    emit(
      state.copyWith(
        avatar: user.avatar,
        listRoom: user.rooms ?? [],
        listDevice: [],
      ),
    );
    await streamValue(user);
  }

  Future<void> streamValue(UserEntities user) async {
    user.devices?.map(
      (e) {
        return _streamDeviceUseCase.run(e).listen(
          (event) {
            final index = listDevice.indexWhere(
              (element) => element.id == event?.id,
            );
            if (event != null) {
              if (index < 0) {
                listDevice.add(event);
              } else {
                listDevice[index] = event;
              }
            }
            emit(
              state.copyWith(
                listDevice: [...listDevice],
              ),
            );
          },
        );
      },
    ).toList();
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
        listRoom: list,
      ),
    );
  }

  void onTapIndex(int index) {
    indexSelector = index;
  }

  Future<void> changeStatus(
    bool value,
    DeviceEntities device,
  ) async {
    final deviceEntities = DeviceEntities(
      nameDevice: device.nameDevice,
      state: value,
      connectWifi: device.connectWifi,
      id: device.id,
    );
    device = device.copyWith(state: value);
    await _updateStateDeviceUseCase.run(deviceEntities);
  }

  Future<void> removeRoom(String id) async {
    await _removeRoomUseCase.run(id);
    await initState();
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      ); 
           
      emit(
        state.copyWith(getResult: qrCode),
      );
    } on PlatformException {
      emit(
        state.copyWith(getResult: 'failed '),
      );
    }
  }
}
