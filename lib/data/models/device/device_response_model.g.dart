// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceResponseModel _$DeviceResponseModelFromJson(Map<String, dynamic> json) =>
    DeviceResponseModel(
      idDevice: json['id_device'] as String,
      room: json['room'] as String,
    );

Map<String, dynamic> _$DeviceResponseModelToJson(
        DeviceResponseModel instance) =>
    <String, dynamic>{
      'id_device': instance.idDevice,
      'room': instance.room,
    };
