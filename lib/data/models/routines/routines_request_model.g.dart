// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routines_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutinesRequestModel _$RoutinesRequestModelFromJson(
        Map<String, dynamic> json) =>
    RoutinesRequestModel(
      timeBefore: json['timeBefore'] as String,
      routine: RoutineModel.fromJson(json['routine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoutinesRequestModelToJson(
        RoutinesRequestModel instance) =>
    <String, dynamic>{
      'timeBefore': instance.timeBefore,
      'routine': instance.routine.toJson(),
    };
