import '../../../injection/injector.dart';
import '../../entities/my_home/routines/routines_entities.dart';
import '../../repositories/routines_repository.dart';
import '../use_case.dart';

class StreamRoutinesUseCase
    implements StreamUseCase<String, RoutinesEntities?> {
  @override
  Stream<RoutinesEntities?> run(input) =>
      injector.get<RoutinesRepository>().streamRoutine(input);
}
