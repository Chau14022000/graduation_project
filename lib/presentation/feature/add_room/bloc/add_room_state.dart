import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/my_home/home/room_entities.dart';


part 'add_room_state.freezed.dart';

@freezed
class AddRoomState with _$AddRoomState {
  factory AddRoomState({
    required RoomEntities roomSelector,
    required List<RoomEntities> listRoom,
  }) = _AddRoomState;

  const AddRoomState._();

  factory AddRoomState.initial() => AddRoomState(
        roomSelector: RoomEntities.pure(),
        listRoom: roomDefault,
      );
}
