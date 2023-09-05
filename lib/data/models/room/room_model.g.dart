// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      image: json['image'] as int,
      name: json['name'] as String,
      id: json['id'] as String?,
      devices:
          (json['devices'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'devices': instance.devices,
    };
