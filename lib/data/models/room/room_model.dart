import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/my_home/home/room_entities.dart';

part 'room_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class RoomModel {
  RoomModel({
    required this.image,
    required this.name,
    this.id,
    this.devices,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image')
  final int image;

  @JsonKey(name: 'id')
  late String? id;

  @JsonKey(name: 'devices')
  final List<String>? devices;

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);

  IconType? convertIconData() {
    switch (image) {
      case 0:
        return IconType.kitchen;
      case 1:
        return IconType.bedroom;
      case 2:
        return IconType.bathroom;
      case 3:
        return IconType.office;
      case 4:
        return IconType.tvRoom;
      case 5:
        return IconType.livingRoom;
      case 6:
        return IconType.garage;
      case 7:
        return IconType.toilet;
      case 8:
        return IconType.kidRoom;
    }
    return null;
  }

  RoomEntities toRoomEntities() => RoomEntities(
        icon: convertIconData()!,
        nameRoom: name,
        id: id,
        status: false,
        devices: devices,
      );
}
