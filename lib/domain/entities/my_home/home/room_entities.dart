import 'package:flutter/material.dart';

import '../../../../data/models/room/room_model.dart';

enum IconType {
  kitchen,
  bedroom,
  bathroom,
  office,
  tvRoom,
  livingRoom,
  garage,
  toilet,
  kidRoom,
}

class RoomEntities {
  RoomEntities({
    required this.icon,
    required this.nameRoom,
    this.devices,
    this.status,
    this.id,
  });

  factory RoomEntities.pure() => RoomEntities(
        icon: IconType.kitchen,
        nameRoom: '',
        status: true,
        devices: [],
      );

  late IconType icon;
  final String nameRoom;
  late bool? status;
  final List<String>? devices;
  final String? id;

  int convertIconData() {
    switch (icon) {
      case IconType.kitchen:
        return 0;
      case IconType.bedroom:
        return 1;
      case IconType.bathroom:
        return 2;
      case IconType.office:
        return 3;
      case IconType.tvRoom:
        return 4;
      case IconType.livingRoom:
        return 5;
      case IconType.garage:
        return 6;
      case IconType.toilet:
        return 7;
      case IconType.kidRoom:
        return 8;
    }
  }

  RoomModel toRoomModel() => RoomModel(
        image: convertIconData(),
        name: nameRoom,
        devices: devices,
        id: id,
      );

  IconData get covertIcon {
    switch (icon) {
      case IconType.kitchen:
        return Icons.kitchen_outlined;
      case IconType.bedroom:
        return Icons.bed_outlined;
      case IconType.bathroom:
        return Icons.bathroom_outlined;
      case IconType.office:
        return Icons.computer_outlined;
      case IconType.tvRoom:
        return Icons.live_tv_outlined;
      case IconType.livingRoom:
        return Icons.living_outlined;
      case IconType.garage:
        return Icons.garage_outlined;
      case IconType.toilet:
        return Icons.wc_outlined;
      case IconType.kidRoom:
        return Icons.bedroom_baby_outlined;
    }
  }
}

final List<RoomEntities> roomDefault = [
  RoomEntities(
    icon: IconType.kitchen,
    nameRoom: 'Kitchen',
    status: false,
  ),
  RoomEntities(
    icon: IconType.bedroom,
    nameRoom: 'Bedroom',
    status: false,
  ),
  RoomEntities(
    icon: IconType.bathroom,
    nameRoom: 'BathRoom',
    status: false,
  ),
  RoomEntities(
    icon: IconType.office,
    nameRoom: 'OfficeRoom',
    status: false,
  ),
  RoomEntities(
    icon: IconType.tvRoom,
    nameRoom: 'TV Room',
    status: false,
  ),
  RoomEntities(
    icon: IconType.livingRoom,
    nameRoom: 'Living Room',
    status: false,
  ),
  RoomEntities(
    icon: IconType.garage,
    status: false,
    nameRoom: 'Garage',
  ),
  RoomEntities(
    icon: IconType.toilet,
    nameRoom: 'Toilet',
    status: false,
  ),
  RoomEntities(
    icon: IconType.kidRoom,
    nameRoom: 'Kit Room',
    status: false,
  ),
];
