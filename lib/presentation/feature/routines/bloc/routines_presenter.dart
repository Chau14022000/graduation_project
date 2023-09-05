import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../domain/entities/my_home/routines/routines_entities.dart';
import '../../../../domain/entities/user/user_entities.dart';
import '../../../../domain/use_cases/routines/remove_routine_use_case.dart';
import '../../../../domain/use_cases/routines/stream_routines_user_case.dart';
import '../../../../domain/use_cases/routines/update_state_routines_use_case.dart';
import 'routines_state.dart';

class RoutinesPresenter extends Cubit<RoutinesState> {
  RoutinesPresenter(
    this._getAccountUseCase,
    this._updateStateRoutinesUseCase,
    this._removeRoutinesUseCase,
    this._streamRoutinesUseCase, {
    @visibleForTesting RoutinesState? state,
  }) : super(
          state ?? RoutinesState.initial(),
        );
  final GetAccountUseCase _getAccountUseCase;
  final UpdateStateRoutinesUseCase _updateStateRoutinesUseCase;
  final RemoveRoutinesUseCase _removeRoutinesUseCase;
  final StreamRoutinesUseCase _streamRoutinesUseCase;

  Future<void> initState() async {
    final user = await _getAccountUseCase.run();
    emit(
      state.copyWith(
        image: user.avatar,
      ),
    );
    await streamValue(user);
  }

  Future<void> streamValue(UserEntities user) async {
    final listRoutines = <RoutinesEntities>[];
    final listRoutinesToday = <RoutinesEntities>[];
    user.routines?.map(
      (e) {
        return _streamRoutinesUseCase.run(e).listen(
          (event) {
            final index = listRoutines.indexWhere(
              (element) => element.id == event?.id,
            );
            if (event != null) {
              if (index < 0) {
                listRoutines.add(event);
              } else {
                listRoutines[index] = event;
              }
            }
            emit(
              state.copyWith(
                listRoutines: [...listRoutines],
              ),
            );

            final indexToday = listRoutinesToday.indexWhere(
              (element) => element.id == event?.id,
            );
            if (event != null) {
              if (event.convertDayInWeek.contains(
                    DateFormat('EEEE').format(
                      DateTime.now(),
                    ),
                  ) ||
                  event.convertDayInWeek.contains('Every Day')) {
                if (indexToday < 0) {
                  listRoutinesToday.add(event);
                } else {
                  listRoutinesToday[indexToday] = event;
                }
              }
            }
            emit(
              state.copyWith(
                listRoutines: [...listRoutines],
                listRoutinesToday: [...listRoutinesToday],
              ),
            );
          },
        );
      },
    ).toList();
  }

  Future<void> changeStatus(
    bool value,
    RoutinesEntities routinesEntities,
  ) async {
    final routines = RoutinesEntities(
      dayInWeek: routinesEntities.dayInWeek,
      devices: routinesEntities.devices,
      timeStart: routinesEntities.timeStart,
      status: value,
      id: routinesEntities.id,
      onOffDevice: [],
    );
    await _updateStateRoutinesUseCase.run(routines);
  }

  Future<void> removeRoutine(RoutinesEntities routinesEntities) async {
    final list = <RoutinesEntities>[];
    list.addAll(state.listRoutines);
    list.remove(routinesEntities);
    final listToday = <RoutinesEntities>[];
    listToday.addAll(state.listRoutinesToday);
    listToday.remove(routinesEntities);
    await _removeRoutinesUseCase.run(routinesEntities);
    emit(
      state.copyWith(
        listRoutines: list,
        listRoutinesToday: listToday,
      ),
    );
  }
}
