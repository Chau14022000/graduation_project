import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../../domain/entities/my_home/home/room_entities.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required RoomEntities roomSelector,
    required String getResult,
    required List<RoomEntities> listRoom,
    required List<DeviceEntities> listDevice,
    String? avatar,
  }) = _HomeState;

  const HomeState._();

  factory HomeState.initial() => HomeState(
        roomSelector: RoomEntities.pure(),
        listRoom: [],
        listDevice: [],
        getResult: 'QR code result',
      );
}
