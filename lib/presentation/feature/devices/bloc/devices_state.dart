import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';

part 'devices_state.freezed.dart';

@freezed
class DevicesState with _$DevicesState {
  factory DevicesState({
    required List<DeviceEntities> listDevices,
  }) = _DevicesState;

  const DevicesState._();

  factory DevicesState.initial() => DevicesState(
        listDevices: [],
      );
}
