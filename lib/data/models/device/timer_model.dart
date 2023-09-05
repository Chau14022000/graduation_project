import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TimerModel {
  TimerModel({
    required this.listTimer,
    required this.time,
  });
  factory TimerModel.fromJson(Map<String, dynamic> json) =>
      _$TimerModelFromJson(json);

  late String time;
  late List<String> listTimer;

  Map<String, dynamic> toJson() => _$TimerModelToJson(this);
}
