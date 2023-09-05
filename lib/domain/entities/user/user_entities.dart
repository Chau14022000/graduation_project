import '../../../data/models/user/user_model.dart';
import '../my_home/home/room_entities.dart';

class UserEntities {
  UserEntities({
    required this.email,
    required this.password,
    required this.phone,
    required this.gender,
    required this.name,
    this.avatar,
    this.devices,
    this.rooms,
    this.routines,
    this.id,
  });

  factory UserEntities.pure() => UserEntities(
        email: '',
        password: '',
        phone: '',
        name: '',
        gender: 'female',
      );
  final String email;

  final String phone;

  final String gender;

  final String password;

  final String name;

  final String? avatar;

  final List<String>? devices;

  final List<RoomEntities>? rooms;

  final List<String>? routines;

  final String? id;

  UserModel toUserMode() => UserModel(
        id: id,
        email: email,
        password: password,
        phone: phone,
        gender: gender,
        name: name,
        devices: devices,
        avatar: avatar,
        routines: routines,
        rooms: rooms
                ?.map(
                  (e) => e.toRoomModel(),
                )
                .toList() ??
            [],
      );
}
