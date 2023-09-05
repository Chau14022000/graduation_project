import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/my_home/home/device_entities.dart';
import 'timer_model.dart';

part 'device_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeviceModel {
  const DeviceModel({
    required this.state,
    required this.token,
    this.nameDevice,
    this.connectWifi,
    this.timer,
    this.timeWork,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  @JsonKey(
    name: 'name_device',
  )
  final String? nameDevice;

  @JsonKey(name: 'state')
  final bool state;

  @JsonKey(
    name: 'connect_wifi',
    defaultValue: true,
  )
  final bool? connectWifi;

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'timeWork')
  final int? timeWork;

  @JsonKey(
    name: 'timer',
    fromJson: toListString,
    disallowNullValue: true,
    includeIfNull: false,
  )
  final List<TimerModel>? timer;

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);

  DeviceEntities toDeviceEntities() => DeviceEntities(
        nameDevice: nameDevice ?? token,
        state: state,
        connectWifi: connectWifi ?? true,
        id: token,
        timer: timer,
        timeWork: timeWork,
        onOffRoutine: false,
      );

  static List<TimerModel>? toListString(Map? map) {
    if (map == null) {
      return null;
    } else {
      final y = map.values
          .map(
            (e) => (e as List)
                .map(
                  (x) => x as String,
                )
                .toList(),
          )
          .toList();
      final x = map.keys.map((e) => e).toList();
      final list = List<TimerModel>.generate(
        y.length,
        (_) => TimerModel(
          listTimer: [],
          time: '',
        ),
      );
      for (var i = 0; i < y.length; i++) {
        list[i].time = x[i];
        list[i].listTimer = y[i];
      }
      return list;
    }
  }
}
