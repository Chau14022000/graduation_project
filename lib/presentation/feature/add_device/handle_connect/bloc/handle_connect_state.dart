import 'package:freezed_annotation/freezed_annotation.dart';

part 'handle_connect_state.freezed.dart';

enum LoadingDotType { loading, fall, success, none }

@freezed
class HandleConnectState with _$HandleConnectState {
  factory HandleConnectState({
    required int counter,
    required int numberDevice,
    required LoadingDotType finishFind,
    required int numberDeviceConnected,
    required LoadingDotType finishConnect,
    required LoadingDotType loading,
  }) = _HandleConnectState;

  const HandleConnectState._();

  factory HandleConnectState.initial() => HandleConnectState(
        counter: 180,
        numberDevice: 0,
        finishFind: LoadingDotType.none,
        finishConnect: LoadingDotType.none,
        loading: LoadingDotType.none,
        numberDeviceConnected: 0,
      );
}
