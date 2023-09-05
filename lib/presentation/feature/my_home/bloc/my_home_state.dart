import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/user/user_entities.dart';

part 'my_home_state.freezed.dart';

@freezed
class MyHomeState with _$MyHomeState {
  factory MyHomeState({
    required int selectedIndex,
    required UserEntities account,
  }) = _MyHomeState;

  const MyHomeState._();

  factory MyHomeState.initial() => MyHomeState(
        selectedIndex: 0,
        account: UserEntities.pure(),
      );
}
