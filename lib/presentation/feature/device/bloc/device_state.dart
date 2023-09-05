import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';

part 'device_state.freezed.dart';

@freezed
class DeviceState with _$DeviceState {
  factory DeviceState({
    required DeviceEntities deviceEntities,
    required String dropdownValue,
  }) = _DeviceState;

  const DeviceState._();

  factory DeviceState.initial() => DeviceState(
        deviceEntities: DeviceEntities.pure(),
        dropdownValue: '',
      );
}
