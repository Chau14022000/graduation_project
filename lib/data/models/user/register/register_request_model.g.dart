// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
      devices:
          (json['devices'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'password': instance.password,
      'name': instance.name,
      'avatar': instance.avatar,
      'devices': instance.devices,
      'rooms': instance.rooms?.map((e) => e.toJson()).toList(),
    };
