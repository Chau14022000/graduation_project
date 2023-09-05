import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/my_home/routines/routines_entities.dart';

part 'routines_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class RoutineModel {
  RoutineModel({
    required this.timeStart,
    required this.days,
    required this.status,
    required this.devices,
    this.name,
    this.id,
  });

  factory RoutineModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineModelFromJson(json);

  @JsonKey(name: 'name')
  late String? name;

  @JsonKey(name: 'id')
  late String? id;

  @JsonKey(name: 'time_start')
  final String timeStart;

  @JsonKey(name: 'days')
  late List<String> days;

  @JsonKey(name: 'status')
  final bool status;

  @JsonKey(name: 'devices')
  late List<String> devices;

  Map<String, dynamic> toJson() => _$RoutineModelToJson(this);

  List<DayInWeek> convertDayInWeek() {
    final listDay = days.map(
      (e) {
        switch (e) {
          case '1':
            return DayInWeek.monday;
          case '2':
            return DayInWeek.tuesday;
          case '3':
            return DayInWeek.wednesday;
          case '4':
            return DayInWeek.thursday;
          case '5':
            return DayInWeek.friday;
          case '6':
            return DayInWeek.saturday;
          case '0':
            return DayInWeek.sunday;
        }
        return DayInWeek.monday;
      },
    ).toList();

    return listDay;
  }

  RoutinesEntities toRoutinesEntities() => RoutinesEntities(
        dayInWeek: convertDayInWeek(),
        devices: devices,
        status: status,
        timeStart: timeStart,
        name: name,
        id: id,
        onOffDevice: [],
      );
}
