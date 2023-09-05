import '../../domain/entities/my_home/routines/routines_entities.dart';
import '../../domain/repositories/routines_repository.dart';
import '../models/routines/routines_model.dart';
import '../services/network_services/realtime_service.dart';

class RoutinesRepositoryImplement implements RoutinesRepository {
  RoutinesRepositoryImplement(
    this._realtimeService,
  );

  final RealtimeService _realtimeService;

  @override
  Future<void> saveRoutines(
    RoutinesEntities routinesEntities,
  ) async {
    await _realtimeService.saveRoutines(
      routinesEntities.toRoutineModel(),
    );
  }

  @override
  Future<RoutinesEntities> getRoutines(String id) async {
    final routines = await _realtimeService.getRoutines(id);
    return routines.toRoutinesEntities();
  }

  @override
  Future<void> updateStateRoutines(
    RoutinesEntities routinesEntities,
  ) async {
    await _realtimeService.updateStateRoutines(
      routinesEntities.toRoutineModel(),
      routinesEntities.id!,
    );
  }

  @override
  Future<void> removeRoutine(RoutinesEntities routinesEntities) async {
    await _realtimeService.removeRoutine(
      routinesEntities.toRoutineModel(),
    );
  }

  @override
  Future<void> updateRoutines(RoutinesEntities routinesEntities) async {
    await _realtimeService.updateRoutines(
      routinesEntities.toRoutineModel(),
    );
  }

  @override
  Stream<RoutinesEntities?> streamRoutine(String id) {
    final stream = _realtimeService.streamRoutine(id).map<RoutineModel?>(
      (event) {
        final map = event.snapshot.value;
        if (map != null) {
          final routines = RoutineModel.fromJson(
            Map<String, dynamic>.from(map as Map<dynamic, dynamic>),
          );
          routines.id = id;
          return routines;
        } else {
          return null;
        }
      },
    );
    return stream.map(
      (event) {
        if (event != null) {
          return event.toRoutinesEntities();
        } else {
          return null;
        }
      },
    );
  }
}
