import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_wifi_state.freezed.dart';

@freezed
class ConfigWifiState with _$ConfigWifiState {
  factory ConfigWifiState({
    required bool statusButton,
  }) = _ConfigWifiState;

  const ConfigWifiState._();

  factory ConfigWifiState.initial() => ConfigWifiState(
        statusButton: false,
      );
}
