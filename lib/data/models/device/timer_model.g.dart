// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimerModel _$TimerModelFromJson(Map<String, dynamic> json) => TimerModel(
      listTimer:
          (json['listTimer'] as List<dynamic>).map((e) => e as String).toList(),
      time: json['time'] as String,
    );

Map<String, dynamic> _$TimerModelToJson(TimerModel instance) =>
    <String, dynamic>{
      'time': instance.time,
      'listTimer': instance.listTimer,
    };
