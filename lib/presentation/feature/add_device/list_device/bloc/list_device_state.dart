import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_device_state.freezed.dart';

@freezed
class ListDeviceState with _$ListDeviceState {
  factory ListDeviceState({
    required List<String> listIdDevice,
  }) = _DeviceState;

  const ListDeviceState._();

  factory ListDeviceState.initial() => ListDeviceState(
        listIdDevice: [],
      );
}
