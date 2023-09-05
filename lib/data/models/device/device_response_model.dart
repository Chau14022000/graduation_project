import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/my_home/home/device_response_entities.dart';

part 'device_response_model.g.dart';

@JsonSerializable()
class DeviceResponseModel {
  const DeviceResponseModel({
    required this.idDevice,
    required this.room,
  });

  factory DeviceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceResponseModelFromJson(json);

  @JsonKey(name: 'id_device')
  final String idDevice;

  @JsonKey(name: 'room')
  final String room;

  Map<String, dynamic> toJson() => _$DeviceResponseModelToJson(this);

  DeviceResponseEntities toDeviceResponseEntities() => DeviceResponseEntities(
        idDevice: idDevice,
        room: room,
      );
}
