import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/user/user_entities.dart';
import '../room/room_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class UserModel {
  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'devices')
  final List<String>? devices;

  @JsonKey(
    name: 'rooms',
    fromJson: toListRoomModel,
    disallowNullValue: true,
    includeIfNull: false,
  )
  final List<RoomModel>? rooms;

  @JsonKey(name: 'routines')
  final List<String>? routines;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntities toUserEntities() => UserEntities(
        email: email,
        password: password,
        phone: phone,
        gender: gender,
        name: name,
        id: id,
        devices: devices,
        rooms: rooms
            ?.map(
              (e) => e.toRoomEntities(),
            )
            .toList(),
        routines: routines,
        avatar: avatar,
      );

  static List<RoomModel>? toListRoomModel(Map? mapRooms) {
    List<RoomModel> list;
    if (mapRooms == null) {
      return null;
    } else {
      list = mapRooms.values
          .map(
            (e) => RoomModel.fromJson(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList();
      final x = mapRooms.keys.map((e) => e).toList();
      for (var i = 0; i < list.length; i++) {
        list[i].id = x[i];
      }
    }
    return list;
  }

  
}
