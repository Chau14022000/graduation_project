import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'my_home_state.dart';

class MyHomePresenter extends Cubit<MyHomeState> {
  MyHomePresenter({
    @visibleForTesting MyHomeState? state,
  }) : super(
          state ?? MyHomeState.initial(),
        );

  void onTapIndex(int index) {
    emit(
      state.copyWith(selectedIndex: index),
    );
  }
}
