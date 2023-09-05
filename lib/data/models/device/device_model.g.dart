// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['timer'],
  );
  return DeviceModel(
    state: json['state'] as bool,
    token: json['token'] as String,
    nameDevice: json['name_device'] as String?,
    connectWifi: json['connect_wifi'] as bool? ?? true,
    timer: DeviceModel.toListString(json['timer'] as Map?),
    timeWork: json['timeWork'] as int?,
  );
}

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) {
  final val = <String, dynamic>{
    'name_device': instance.nameDevice,
    'state': instance.state,
    'connect_wifi': instance.connectWifi,
    'token': instance.token,
    'timeWork': instance.timeWork,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timer', instance.timer?.map((e) => e.toJson()).toList());
  return val;
}
