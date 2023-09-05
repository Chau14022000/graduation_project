import '../../../../data/models/routines/routines_request_model.dart';
import 'routines_entities.dart';

class RoutinesRequestEntities {
  RoutinesRequestEntities({
    required this.timeBefore,
    required this.routine,
  });

  final String timeBefore;
  final RoutinesEntities routine;

  RoutinesRequestModel toRoutineRequestModel() => RoutinesRequestModel(
        timeBefore: timeBefore,
        routine: routine.toRoutineModel(),
      );
}
