import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/my_home/routines/routines_entities.dart';


part 'routines_state.freezed.dart';

@freezed
class RoutinesState with _$RoutinesState {
  factory RoutinesState({
    required bool onTap,
    required List<RoutinesEntities> listRoutines,
    required List<RoutinesEntities> listRoutinesToday,
    String? image,
  }) = _RoutinesState;

  const RoutinesState._();

  factory RoutinesState.initial() => RoutinesState(
        listRoutines: [],
        listRoutinesToday: [],
        onTap: true,
      );
}
