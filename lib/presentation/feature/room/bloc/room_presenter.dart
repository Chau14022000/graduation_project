import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../../domain/entities/my_home/home/room_entities.dart';
import '../../../../domain/use_cases/device/stream_device_use_case.dart';
import '../../../../domain/use_cases/device/update_state_device_use_case.dart';
import 'room_state.dart';

class RoomPresenter extends Cubit<RoomState> {
  RoomPresenter(
    this._updateStateDeviceUseCase,
    this._getListDeviceUseCase, {
    @visibleForTesting RoomState? state,
  }) : super(
          state ?? RoomState.initial(),
        );
  final StreamDeviceUseCase _getListDeviceUseCase;
  final UpdateStateDeviceUseCase _updateStateDeviceUseCase;
  final listDevice = <DeviceEntities>[];

  int indexSelector = 0;

  Future<void> initState(RoomEntities roomEntities) async {
    await streamValue(roomEntities);
    emit(
      state.copyWith(roomEntities: roomEntities),
    );
  }

  Future<void> streamValue(RoomEntities roomEntities) async {
    if (roomEntities != state.roomEntities) {
      emit(
        state.copyWith(
          listDevice: [],
        ),
      );
    }
    roomEntities.devices?.map(
      (e) {
        return _getListDeviceUseCase.run(e).listen(
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
}
