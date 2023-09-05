import 'package:flutter/cupertino.dart';

class RoomRequestEntities {
  RoomRequestEntities({
    required this.icon,
    required this.nameRoom,
    required this.status,
    required this.numberDevices,
  });

  final IconData icon;
  final String nameRoom;
  final int numberDevices;
  late bool status;
  
}
