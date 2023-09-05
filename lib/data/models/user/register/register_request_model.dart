import 'package:json_annotation/json_annotation.dart';

import '../../room/room_model.dart';

part 'register_request_model.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class RegisterRequestModel {
  const RegisterRequestModel({
    required this.email,
    required this.password,
    required this.phone,
    required this.gender,
    required this.name,
    this.avatar,
    this.devices,
    this.rooms,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

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

  @JsonKey(name: 'rooms')
  final List<RoomModel>? rooms;

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
