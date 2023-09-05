import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_device_state.dart';

class ListDevicePresenter extends Cubit<ListDeviceState> {
  ListDevicePresenter({
    @visibleForTesting ListDeviceState? state,
  }) : super(state ?? ListDeviceState.initial());

  Future<void> onStateCreated(List<String> listIdDevice) async {
    emit(
      state.copyWith(listIdDevice: listIdDevice),
    );
  }
}
