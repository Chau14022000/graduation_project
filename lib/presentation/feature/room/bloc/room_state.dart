import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../../domain/entities/my_home/home/room_entities.dart';

part 'room_state.freezed.dart';

@freezed
class RoomState with _$RoomState {
  factory RoomState({
    required RoomEntities roomEntities,
    required List<DeviceEntities> listDevice,
  }) = _RoomState;

  const RoomState._();

  factory RoomState.initial() => RoomState(
        roomEntities: RoomEntities.pure(),
        listDevice: [],
      );
}
