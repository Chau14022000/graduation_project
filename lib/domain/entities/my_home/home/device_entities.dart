
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/device/timer_model.dart';

part 'device_entities.freezed.dart';

@unfreezed
class DeviceEntities with _$DeviceEntities {
  factory DeviceEntities({
    required String nameDevice,
    required bool state,
    required bool connectWifi,
    required String id,
    @Default(false) bool deviceSelect,
    List<TimerModel>? timer,
    int? timeWork,
    @Default(true) bool onOffRoutine,
  }) = _DeviceEntities;

  factory DeviceEntities.pure() => DeviceEntities(
        nameDevice: '',
        state: true,
        connectWifi: true,
        id: '',
        deviceSelect: false,
      );
}
