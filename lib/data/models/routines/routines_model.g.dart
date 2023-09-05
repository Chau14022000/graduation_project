// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routines_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineModel _$RoutineModelFromJson(Map<String, dynamic> json) => RoutineModel(
      timeStart: json['time_start'] as String,
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as bool,
      devices:
          (json['devices'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RoutineModelToJson(RoutineModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'time_start': instance.timeStart,
      'days': instance.days,
      'status': instance.status,
      'devices': instance.devices,
    };
