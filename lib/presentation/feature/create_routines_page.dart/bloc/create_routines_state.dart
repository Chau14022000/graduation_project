import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/device/timer_model.dart';
import '../../../../domain/entities/my_home/home/device_entities.dart';

part 'create_routines_state.freezed.dart';

@freezed
class CreateRoutinesState with _$CreateRoutinesState {
  factory CreateRoutinesState({
    required bool status,
    required List<DeviceEntities?> listDevice,
    required List<bool> chooseDays,
    required bool isEveryDay,
    required List<bool> onOffDevice,
    TimeOfDay? startTime,
  }) = _CreateRoutinesState;

  const CreateRoutinesState._();

  factory CreateRoutinesState.initial() => CreateRoutinesState(
        isEveryDay: false,
        status: true,
        listDevice: [],
        chooseDays: List.generate(
          7,
          (index) => false,
        ).toList(),
        onOffDevice: []
      );
}
