import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(
  createToJson: false,
  createFactory: false,
)
class DeviceResponseEntities {
  const DeviceResponseEntities({
    required this.idDevice,
    required this.room,
  });

  @JsonKey(name: 'id_device')
  final String idDevice;

  @JsonKey(name: 'room')
  final String room;
}
