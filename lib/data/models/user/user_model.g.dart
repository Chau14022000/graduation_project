// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['rooms'],
  );
  return UserModel(
    email: json['email'] as String,
    password: json['password'] as String,
    phone: json['phone'] as String,
    gender: json['gender'] as String,
    name: json['name'] as String,
    avatar: json['avatar'] as String?,
    devices:
        (json['devices'] as List<dynamic>?)?.map((e) => e as String).toList(),
    rooms: UserModel.toListRoomModel(json['rooms'] as Map?),
    routines:
        (json['routines'] as List<dynamic>?)?.map((e) => e as String).toList(),
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'email': instance.email,
    'phone': instance.phone,
    'gender': instance.gender,
    'password': instance.password,
    'name': instance.name,
    'avatar': instance.avatar,
    'devices': instance.devices,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rooms', instance.rooms?.map((e) => e.toJson()).toList());
  val['routines'] = instance.routines;
  return val;
}
