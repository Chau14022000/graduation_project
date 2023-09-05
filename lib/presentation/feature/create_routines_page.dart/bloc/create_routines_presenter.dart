import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../../domain/entities/my_home/routines/routines_entities.dart';
import '../../../../domain/entities/my_home/routines/routines_request_entities.dart';
import '../../../../domain/use_cases/device/get_device_use_case.dart';
import '../../../../domain/use_cases/device/up_timer_device_use_case.dart';
import '../../../../domain/use_cases/routines/save_routines_use_case.dart';
import '../../../../domain/use_cases/routines/update_routine_use_case.dart';
import 'create_routines_state.dart';

class CreateRoutinesPresenter extends Cubit<CreateRoutinesState> {
  CreateRoutinesPresenter(
    this._saveRoutinesUseCase,
    this._upTimerDeviceUseCase,
    this._getDevicesUseCase,
    this._updateRoutinesUseCase, {
    @visibleForTesting CreateRoutinesState? state,
  }) : super(
          state ?? CreateRoutinesState.initial(),
        );

  final SaveRoutinesUseCase _saveRoutinesUseCase;
  final UpTimerDeviceUseCase _upTimerDeviceUseCase;
  final GetDevicesUseCase _getDevicesUseCase;
  final UpdateRoutinesUseCase _updateRoutinesUseCase;
  TextEditingController scheduleEditingController = TextEditingController();
  final listDay = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  var listIndex = [];
  bool isEdit = false;
  bool isCheck = true;
  String timeBefore = '';
  String? id;

  Future<void> initState(
    List<DeviceEntities> deviceEntities,
    RoutinesEntities? routinesEntities,
  ) async {
    bool everyDay;
    if (routinesEntities == null) {
      final list = [];
      list.addAll(state.listDevice);
      list.addAll(deviceEntities);
      emit(
        state.copyWith(listDevice: [...list]),
      );
      final listOnOff = <bool>[];
      state.listDevice.forEach((element) {
        listOnOff.add(true);
      });
      emit(state.copyWith(onOffDevice: listOnOff));
    } else {
      timeBefore = routinesEntities.timeStart;
      id = routinesEntities.id;
      isEdit = true;
      scheduleEditingController =
          TextEditingController(text: routinesEntities.name);
      if (routinesEntities.convertDayStringNumber.length == 7) {
        everyDay = true;
      } else {
        everyDay = false;
      }
      final list = [1, 2, 3, 4, 5, 6, 0];
      final listY = routinesEntities.convertDayStringNumber
          .map((e) => int.parse(e))
          .toList();
      final listX = <bool>[];

      for (final e in list) {
        if (listY.contains(e)) {
          listX.add(true);
        } else {
          listX.add(false);
        }
      }
      for (var i = 0; i < listX.length; i++) {
        if (listX[i]) {
          listIndex.add(i);
        }
      }
      if (isCheck) {
        emit(
          state.copyWith(
            listDevice: await Future.wait(
              routinesEntities.devices.map(
                (e) async => _getDevicesUseCase.run(e),
              ),
            ),
          ),
        );
        isCheck = false;
      }

      emit(
        state.copyWith(
          startTime: TimeOfDay(
            hour: int.parse(routinesEntities.timeStart.split(':')[0]),
            minute: int.parse(routinesEntities.timeStart.split(':')[1]),
          ),
          status: routinesEntities.status,
          isEveryDay: everyDay,
          chooseDays: listX,
        ),
      );
      final listDevice = [];
      listDevice.addAll(state.listDevice);
      listDevice.addAll(deviceEntities);
      emit(
        state.copyWith(listDevice: [...listDevice]),
      );
      final listStem = [];
      final listOnOff = <bool>[];
      for (final element in state.listDevice) {
        {
          element?.timer?.forEach(
            (e) {
              if (e.time == timeBefore) {
                if (e.listTimer.contains('10')) {
                  listOnOff.add(true);
                } else {
                  listOnOff.add(false);
                }
                if (e.listTimer[e.listTimer.length - 2] == '21') {
                  listStem.add(
                    element.copyWith(onOffRoutine: true),
                  );
                } else {
                  listStem.add(
                    element.copyWith(onOffRoutine: false),
                  );
                }
              }
            },
          );
        }
      }
      emit(
        state.copyWith(
          listDevice: [...listStem],
          onOffDevice: [...listOnOff],
        ),
      );
    }
  }

  void setStartTime(TimeOfDay? timeOfDay) {
    if (timeOfDay != null) {
      emit(
        state.copyWith(startTime: timeOfDay),
      );
    }
  }

  void setChooseAll(bool value) {
    final list = <bool>[];
    if (value) {
      list.addAll(
        state.chooseDays.map((e) => true),
      );
      emit(
        state.copyWith(
          isEveryDay: value,
          chooseDays: [...list],
        ),
      );
    } else {
      list.addAll(
        state.chooseDays.map((e) => false),
      );
      emit(
        state.copyWith(
          isEveryDay: value,
          chooseDays: [...list],
        ),
      );
    }
  }

  void setChooseDay(int index, value) {
    final list = <bool>[];
    if (value) {
      listIndex.add(index);
    } else {
      listIndex.remove(index);
      emit(
        state.copyWith(isEveryDay: false),
      );
    }
    list.addAll(state.chooseDays);

    list[index] = value;
    if (list.where((element) => element == true).length == 7) {
      emit(
        state.copyWith(isEveryDay: true),
      );
    }
    emit(
      state.copyWith(
        chooseDays: [...list],
      ),
    );
  }

  void changeStatus(bool value) {
    emit(
      state.copyWith(status: value),
    );
  }

  Future<bool> saveRoutines() async {
    final checkSave = state.startTime != null &&
        state.chooseDays.contains(true) &&
        state.listDevice.isNotEmpty;

    if (state.isEveryDay) {
      listIndex = [1, 2, 3, 4, 5, 6, 0];
    }
    if (checkSave) {
      listIndex.sort();
      final list = <String>[];
      for (final element in listIndex) {
        list.add(listDay[element]);
      }

      final routinesEntities = RoutinesEntities(
        name: scheduleEditingController.text == ''
            ? state.listDevice.map((e) => e?.nameDevice).toList().first
            : scheduleEditingController.text,
        timeStart: '${state.startTime?.hour.toString().padLeft(2, '0')}'
            ':${state.startTime?.minute.toString().padLeft(2, '0')}',
        dayInWeek: list
            .map(
              (e) => convertDay(e)!,
            )
            .toList(),
        status: state.status,
        devices: state.listDevice.map((e) => e!.id).toList(),
        onOffDevice: state.onOffDevice,
        id: id,
      );
      final routinesRequestEntities = RoutinesRequestEntities(
        timeBefore: timeBefore,
        routine: routinesEntities,
      );
      await _upTimerDeviceUseCase.run(routinesRequestEntities);
      if (!isEdit) {
        await _saveRoutinesUseCase.run(routinesEntities);
      } else {
        await _updateRoutinesUseCase.run(routinesEntities);
      }

      return true;
    }
    return false;
  }

  void onToggle(bool value, int index) {
    final list = [...state.listDevice].map((e) {
      return e?.copyWith();
    }).toList();
    final listOnOff = <bool>[];
    listOnOff.addAll(state.onOffDevice);
    for (var i = 0; i < state.listDevice.length; i++) {
      if (i == index) {
        list[index]?.timer?.forEach((element) {
          element.listTimer.removeAt(element.listTimer.length - 1);
          if (element.time == timeBefore) {
            if (value) {
              element.listTimer.add('10');
              listOnOff[index] = true;
              emit(state.copyWith(onOffDevice: [...listOnOff]));
            } else {
              element.listTimer.add('11');
              listOnOff[index] = false;
              emit(state.copyWith(onOffDevice: [...listOnOff]));
            }
          }
        });
      }
    }
    emit(
      state.copyWith(listDevice: [...list]),
    );
  }

  void stateDevice(bool value, int index) {
    final list = <DeviceEntities?>[];
    for (var i = 0; i < state.listDevice.length; i++) {
      list.add(state.listDevice[i]);
      if (i == index) {
        list[index] = list[index]?.copyWith(onOffRoutine: value);
      }
    }
    emit(
      state.copyWith(listDevice: [...list]),
    );
  }

  void removeDevice(DeviceEntities? device) {
    final list = <DeviceEntities?>[];
    list.addAll(state.listDevice);
    list.remove(device);
    emit(
      state.copyWith(listDevice: list),
    );
  }
}
