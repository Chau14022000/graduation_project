import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../../domain/entities/my_home/home/room_entities.dart';
import '../../../../domain/entities/user/user_entities.dart';
import '../../../../domain/use_cases/device/stream_device_use_case.dart';
import '../../../../domain/use_cases/device/update_state_device_use_case.dart';
import '../../../../domain/use_cases/room/update_room_use_case.dart';
import '../../../../domain/use_cases/user/get_account_use_case.dart';
import 'device_state.dart';

class DevicePresenter extends Cubit<DeviceState> {
  DevicePresenter(
    this._getDeviceUseCase,
    this._updateStateDeviceUseCase,
    this._getAccountUseCase,
    this._updateRoomUseCase, {
    @visibleForTesting DeviceState? state,
  }) : super(
          state ?? DeviceState.initial(),
        );
  final StreamDeviceUseCase _getDeviceUseCase;
  final UpdateStateDeviceUseCase _updateStateDeviceUseCase;
  final UpdateRoomUseCase _updateRoomUseCase;
  final GetAccountUseCase _getAccountUseCase;
  late TextEditingController nameDevice = TextEditingController();
  final device = DeviceEntities.pure();
  final Map<String, String> rooms = {'': ''};
  late UserEntities account = UserEntities.pure();

  void initState(String id) {
    streamValue(id);
  }

  Future<void> getRoom() async {
    nameDevice = TextEditingController(text: state.deviceEntities.nameDevice);
    final user = await _getAccountUseCase.run();
    account = user;
    if (user.rooms != null) {
      user.rooms
          ?.map(
            (e) => rooms[e.id!] = '${e.nameRoom}_${e.id!.substring(1, 6)}',
          )
          .toList();
    }
  }

  void changeRoomSelector(String room) {
    emit(
      state.copyWith(dropdownValue: room),
    );
  }

  Future<void> streamValue(String id) async {
    _getDeviceUseCase.run(id).listen(
      (event) {
        if (event != null) {
          emit(
            state.copyWith(
              deviceEntities: event,
            ),
          );
        }
      },
    );
  }

  String format(Duration d) {
    final day = int.parse(
      d.inDays.toString().padLeft(0, '2'),
    );
    final hours = int.parse(
      Duration(
        seconds: d.inSeconds - day * 24 * 60 * 60,
      ).inHours.toString().padLeft(0, '2'),
    );
    final minutes = int.parse(
      d.inMinutes.remainder(60).toString().padLeft(2, '0'),
    );
    final seconds = int.parse(
      d.inSeconds.remainder(60).toString().padLeft(2, '0'),
    );
    if (day != 0) {
      return '$day ngày $hours giờ $minutes phut $seconds giây';
    } else {
      if (hours != 0) {
        return '$hours giờ $minutes phut $seconds giây';
      } else {
        if (minutes != 0) {
          return '$minutes phut $seconds giây';
        } else {
          if (seconds != 0) {
            return '$seconds giây';
          }
        }
      }
    }
    return 'Chưa hoạt động';
  }

  Future<void> changeStatus() async {
    final deviceEntities = DeviceEntities(
      nameDevice: state.deviceEntities.nameDevice,
      state: !state.deviceEntities.state,
      connectWifi: state.deviceEntities.connectWifi,
      id: state.deviceEntities.id,
    );
    await _updateStateDeviceUseCase.run(deviceEntities);
  }

  Future<void> saveDevice() async {
    RoomEntities? room;
    rooms.forEach(
      (key, value) async {
        if (value == state.dropdownValue) {
          account.rooms?.forEach(
            (element) {
              if (element.id == key) {
                room = element;
              }
            },
          );
        }
      },
    );
    if (room != null) {
      if (room?.devices != null) {
        room?.devices!.add(state.deviceEntities.id);
        final _set = <String>{...?room?.devices};
        await _updateRoomUseCase.run(
          RoomEntities(
            icon: room!.icon,
            nameRoom: room!.nameRoom,
            devices: _set.toList(),
            id: room!.id,
          ),
        );
      } else {
        await _updateRoomUseCase.run(
          RoomEntities(
            icon: room!.icon,
            nameRoom: room!.nameRoom,
            devices: [state.deviceEntities.id],
            id: room!.id,
          ),
        );
      }
    }
    final deviceEntities = DeviceEntities(
      nameDevice: nameDevice.text,
      state: state.deviceEntities.state,
      connectWifi: state.deviceEntities.connectWifi,
      id: state.deviceEntities.id,
    );
    await _updateStateDeviceUseCase.run(deviceEntities);
  }
}
