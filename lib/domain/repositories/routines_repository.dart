import '../entities/my_home/routines/routines_entities.dart';

abstract class RoutinesRepository {
  Future<void> saveRoutines(RoutinesEntities routinesEntities);

  Future<void> updateRoutines(RoutinesEntities routinesEntities);

  Future<RoutinesEntities> getRoutines(String id);

  Stream<RoutinesEntities?> streamRoutine(String id);

  Future<void> updateStateRoutines(
    RoutinesEntities routinesEntities,
  );

  Future<void> removeRoutine(RoutinesEntities routinesEntities);
}
