import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../domain/entities/my_home/home/device_entities.dart';
import '../../../../domain/use_cases/device/get_device_use_case.dart';
import 'devices_state.dart';

class DevicesPresenter extends Cubit<DevicesState> {
  DevicesPresenter(
    this._getAccountUseCase,
    this._getDevicesUseCase, {
    @visibleForTesting DevicesState? state,
  }) : super(
          state ?? DevicesState.initial(),
        );
  final GetAccountUseCase _getAccountUseCase;
  final GetDevicesUseCase _getDevicesUseCase;

  Future<void> initState(List<DeviceEntities?> list) async {
    final listDevice = <DeviceEntities>[];
    final user = await _getAccountUseCase.run();
    if (user.devices != null) {
      await Future.wait(
        user.devices!.map(
          (e) async {
            final device = await _getDevicesUseCase.run(e);
            if (device != null) {
              listDevice.add(device);
            }
          },
        ),
      );
    }

    final listD = <DeviceEntities>[];
    listD.addAll(listDevice);
    for (final element in list) {
      for (final e in listDevice) {
        if (e.id == element?.id) {
          listD.remove(e);
        }
      }
    }
    emit(
      state.copyWith(listDevices: listD),
    );
  }

  void selectDevice(DeviceEntities deviceEntities) {
    final list = [];
    for (final element in state.listDevices) {
      if (element.id == deviceEntities.id) {
        list.add(
          DeviceEntities(
            nameDevice: deviceEntities.nameDevice,
            state: deviceEntities.state,
            connectWifi: deviceEntities.connectWifi,
            id: deviceEntities.id,
            deviceSelect: !deviceEntities.deviceSelect,
          ),
        );
      } else {
        list.add(element);
      }
    }
    emit(
      state.copyWith(
        listDevices: [...list],
      ),
    );
  }

  void addList() {
    final list = <DeviceEntities>[];
    for (final element in state.listDevices) {
      if (element.deviceSelect == true) {
        list.add(element);
      }
    }
    emit(
      state.copyWith(
        listDevices: list,
      ),
    );
  }
}
