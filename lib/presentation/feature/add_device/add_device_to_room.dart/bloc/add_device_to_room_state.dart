import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/entities/my_home/home/room_entities.dart';

part 'add_device_to_room_state.freezed.dart';

@freezed
class AddDeviceToRoomState with _$AddDeviceToRoomState {
  factory AddDeviceToRoomState({
    required RoomEntities roomSelector,
    required List<RoomEntities> listRoom,
  }) = _AddDeviceToRoomState;

  const AddDeviceToRoomState._();

  factory AddDeviceToRoomState.initial() => AddDeviceToRoomState(
        roomSelector: RoomEntities.pure(),
        listRoom: [],
      );
}
