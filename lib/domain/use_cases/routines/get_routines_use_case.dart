import '../../../injection/injector.dart';
import '../../entities/my_home/routines/routines_entities.dart';
import '../../repositories/routines_repository.dart';
import '../use_case.dart';

class GetRoutinesUseCase implements FutureUseCase<String, RoutinesEntities> {
  @override
  Future<RoutinesEntities> run(input) =>
      injector.get<RoutinesRepository>().getRoutines(input);
}
