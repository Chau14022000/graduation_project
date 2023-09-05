import '../../../../data/models/routines/routines_model.dart';

enum DayInWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

class RoutinesEntities {
  RoutinesEntities({
    required this.dayInWeek,
    required this.devices,
    required this.timeStart,
    required this.status,
    required this.onOffDevice,
    this.name,
    this.id,
  });
  factory RoutinesEntities.pure() => RoutinesEntities(
        name: '',
        status: true,
        dayInWeek: [],
        timeStart: '',
        devices: [],
        onOffDevice: [],
      );

  final String? name;
  final String? id;
  final List<DayInWeek> dayInWeek;
  final List<String> devices;
  final List<bool?> onOffDevice;
  final String timeStart;
  late bool status;

  RoutineModel toRoutineModel() => RoutineModel(
        timeStart: timeStart,
        days: convertDayStringNumber,
        status: status,
        name: name,
        devices: devices,
        id: id,
      );

  List<String> get convertDayInWeek {
    var listDay = <String>[];
    if (dayInWeek.length == 7) {
      listDay = ['Every Day'];
    } else {
      listDay = dayInWeek.map(
        (e) {
          switch (e) {
            case DayInWeek.monday:
              return 'MonDay';
            case DayInWeek.tuesday:
              return 'TuesDay';
            case DayInWeek.wednesday:
              return 'Wednesday';
            case DayInWeek.thursday:
              return 'Thursday';
            case DayInWeek.friday:
              return 'Friday';
            case DayInWeek.saturday:
              return 'Saturday';
            case DayInWeek.sunday:
              return 'Sunday';
          }
        },
      ).toList();
    }

    return listDay;
  }

  List<String> get convertDayStringNumber {
    final listDay = dayInWeek.map(
      (e) {
        switch (e) {
          case DayInWeek.monday:
            return '1';
          case DayInWeek.tuesday:
            return '2';
          case DayInWeek.wednesday:
            return '3';
          case DayInWeek.thursday:
            return '4';
          case DayInWeek.friday:
            return '5';
          case DayInWeek.saturday:
            return '6';
          case DayInWeek.sunday:
            return '0';
        }
      },
    ).toList();
    return listDay;
  }
}

DayInWeek? convertDay(String day) {
  switch (day) {
    case 'Mon':
      return DayInWeek.monday;
    case 'Tue':
      return DayInWeek.tuesday;
    case 'Wed':
      return DayInWeek.wednesday;
    case 'Thu':
      return DayInWeek.thursday;
    case 'Fri':
      return DayInWeek.friday;
    case 'Sat':
      return DayInWeek.saturday;
    case 'Sun':
      return DayInWeek.sunday;
  }
  return null;
}
