import '../../../injection/injector.dart';
import '../../entities/my_home/routines/routines_entities.dart';
import '../../repositories/routines_repository.dart';
import '../use_case.dart';

class SaveRoutinesUseCase implements FutureUseCase<RoutinesEntities, void> {
  @override
  Future<void> run(RoutinesEntities input) async {
    await injector.get<RoutinesRepository>().saveRoutines(input);
  }
}
