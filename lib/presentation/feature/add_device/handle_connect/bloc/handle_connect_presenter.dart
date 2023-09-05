import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:esptouch_flutter/esptouch_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/services/network_services/realtime_service.dart';
import '../../../../routes/app_router.gr.dart';
import 'connect_device.dart';
import 'handle_connect_state.dart';

class HandleConnectPresenter extends Cubit<HandleConnectState> {
  HandleConnectPresenter({
    @visibleForTesting HandleConnectState? state,
  }) : super(state ?? HandleConnectState.initial());

  StreamSubscription<ESPTouchResult>? streamSubscription;
  StreamSubscription? streamFirebase;
  Timer? _timer;
  String? idConnect;

  final List<DeviceConnect> devices = [];

  // final streamController = StreamController<ESPTouchResult>();
  // Timer? _timerTest;

  // void startTimerTest() {
  //   const oneSec = Duration(seconds: 3);
  //   _timerTest = Timer.periodic(
  //     oneSec,
  //     (timer) {
  //       streamController.sink.add(
  //         const ESPTouchResult('B4E62D6A36F4', 'B4E62D6A36F4'),
  //       );
  //       timer.cancel();
  //     },
  //   );
  // }

  Future<void> onStateCreated({
    required String ssid,
    required String bssid,
    required String password,
    required ESPTouchPacket packet,
    required BuildContext context,
  }) async {
    // startTimerTest();
    emit(
      state.copyWith(
        counter: 180,
        numberDevice: 0,
        finishFind: LoadingDotType.loading,
        finishConnect: LoadingDotType.none,
        loading: LoadingDotType.loading,
        numberDeviceConnected: 0,
      ),
    );
    final task = createTask(
      ssid: ssid,
      bssid: bssid,
      password: password,
      packet: packet,
    );
    startTimer();

    final streamResult = task.execute();

    streamSubscription = streamResult.listen((value) async {
      final bssid = value.bssid.toUpperCase();

      if (packet == ESPTouchPacket.broadcast) {
        final connected = await getConnectedValue(bssid);
        devices.add(DeviceConnect(
          id: bssid,
          connectValue: connected,
          connected: false,
        ));
        emit(
          state.copyWith(
            finishConnect: LoadingDotType.loading,
            numberDevice: state.numberDevice + 1,
            finishFind: packet == ESPTouchPacket.broadcast
                ? LoadingDotType.success
                : LoadingDotType.loading,
          ),
        );
        runStreamDeviceConnected(bssid, connected, context);
      }
    });
    // startTimer();
  }

  Future<int> getConnectedValue(String id) async {
    return RealtimeService().getConnectedValue(id);
  }

  void runStreamDeviceConnected(
    String id,
    int oldValue,
    BuildContext context,
  ) {
    streamFirebase = RealtimeService().streamConnectedDevice(id).listen(
      (event) {
        if (event.snapshot.value as int != oldValue) {
          final index = devices.indexWhere((element) => element.id == id);
          devices[index] = devices[index].copyWith(connected: true);

          final connected = devices.where((element) => element.connected);
          emit(
            state.copyWith(
              finishConnect: LoadingDotType.success,
              numberDeviceConnected: connected.length,
            ),
          );
          streamFirebase?.cancel();
          AutoRouter.of(context).replace(
            ListDeviceRoute(
              listIdDevice: [id],
            ),
          );
          idConnect = id;
        }
      },
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        emit(
          state.copyWith(
            counter: state.counter - 1,
          ),
        );
        if (state.counter == 0) {
          emit(state.copyWith(loading: LoadingDotType.none));
          timer.cancel();
        }
      },
    );
  }

  void onDispose() {
    _timer?.cancel();
    streamSubscription?.cancel();
    streamFirebase?.cancel();
  }

  ESPTouchTask createTask({
    required String ssid,
    required String bssid,
    required String password,
    required ESPTouchPacket packet,
  }) {
    // Duration? durationTryParse(String milliseconds) {
    //   final parsed = int.tryParse(milliseconds);
    //   return parsed != null ? Duration(milliseconds: parsed) : null;
    // }

    return ESPTouchTask(
      ssid: ssid,
      bssid: bssid,
      password: password,
      packet: packet,
      taskParameter: const ESPTouchTaskParameter().copyWith(
          // intervalGuideCode: durationTryParse(intervalGuideCode.text),
          // intervalDataCode: durationTryParse(intervalDataCode.text),
          // timeoutGuideCode: durationTryParse(timeoutGuideCode.text),
          // timeoutDataCode: durationTryParse(timeoutDataCode.text),
          // waitUdpSending: durationTryParse(waitUdpSending.text),
          // waitUdpReceiving: durationTryParse(waitUdpReceiving.text),
          // repeat: int.tryParse(repeat.text),
          // portListening: int.tryParse(portListening.text),
          // portTarget: int.tryParse(portTarget.text),
          // thresholdSucBroadcastCount:
          //     int.tryParse(thresholdSucBroadcastCount.text),
          // expectedTaskResults: int.tryParse(expectedTaskResults.text),
          ),
    );
  }
}
