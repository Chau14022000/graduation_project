import 'package:json_annotation/json_annotation.dart';

import 'routines_model.dart';

part 'routines_request_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class RoutinesRequestModel {
  RoutinesRequestModel({
    required this.timeBefore,
    required this.routine,
  });

  final String timeBefore;
  final RoutineModel routine;
}
