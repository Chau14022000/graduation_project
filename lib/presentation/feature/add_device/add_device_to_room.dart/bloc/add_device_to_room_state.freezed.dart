// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_device_to_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddDeviceToRoomState {
  RoomEntities get roomSelector => throw _privateConstructorUsedError;
  List<RoomEntities> get listRoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddDeviceToRoomStateCopyWith<AddDeviceToRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeviceToRoomStateCopyWith<$Res> {
  factory $AddDeviceToRoomStateCopyWith(AddDeviceToRoomState value,
          $Res Function(AddDeviceToRoomState) then) =
      _$AddDeviceToRoomStateCopyWithImpl<$Res>;
  $Res call({RoomEntities roomSelector, List<RoomEntities> listRoom});
}

/// @nodoc
class _$AddDeviceToRoomStateCopyWithImpl<$Res>
    implements $AddDeviceToRoomStateCopyWith<$Res> {
  _$AddDeviceToRoomStateCopyWithImpl(this._value, this._then);

  final AddDeviceToRoomState _value;
  // ignore: unused_field
  final $Res Function(AddDeviceToRoomState) _then;

  @override
  $Res call({
    Object? roomSelector = freezed,
    Object? listRoom = freezed,
  }) {
    return _then(_value.copyWith(
      roomSelector: roomSelector == freezed
          ? _value.roomSelector
          : roomSelector // ignore: cast_nullable_to_non_nullable
              as RoomEntities,
      listRoom: listRoom == freezed
          ? _value.listRoom
          : listRoom // ignore: cast_nullable_to_non_nullable
              as List<RoomEntities>,
    ));
  }
}

/// @nodoc
abstract class _$$_AddDeviceToRoomStateCopyWith<$Res>
    implements $AddDeviceToRoomStateCopyWith<$Res> {
  factory _$$_AddDeviceToRoomStateCopyWith(_$_AddDeviceToRoomState value,
          $Res Function(_$_AddDeviceToRoomState) then) =
      __$$_AddDeviceToRoomStateCopyWithImpl<$Res>;
  @override
  $Res call({RoomEntities roomSelector, List<RoomEntities> listRoom});
}

/// @nodoc
class __$$_AddDeviceToRoomStateCopyWithImpl<$Res>
    extends _$AddDeviceToRoomStateCopyWithImpl<$Res>
    implements _$$_AddDeviceToRoomStateCopyWith<$Res> {
  __$$_AddDeviceToRoomStateCopyWithImpl(_$_AddDeviceToRoomState _value,
      $Res Function(_$_AddDeviceToRoomState) _then)
      : super(_value, (v) => _then(v as _$_AddDeviceToRoomState));

  @override
  _$_AddDeviceToRoomState get _value => super._value as _$_AddDeviceToRoomState;

  @override
  $Res call({
    Object? roomSelector = freezed,
    Object? listRoom = freezed,
  }) {
    return _then(_$_AddDeviceToRoomState(
      roomSelector: roomSelector == freezed
          ? _value.roomSelector
          : roomSelector // ignore: cast_nullable_to_non_nullable
              as RoomEntities,
      listRoom: listRoom == freezed
          ? _value._listRoom
          : listRoom // ignore: cast_nullable_to_non_nullable
              as List<RoomEntities>,
    ));
  }
}

/// @nodoc

class _$_AddDeviceToRoomState extends _AddDeviceToRoomState {
  _$_AddDeviceToRoomState(
      {required this.roomSelector, required final List<RoomEntities> listRoom})
      : _listRoom = listRoom,
        super._();

  @override
  final RoomEntities roomSelector;
  final List<RoomEntities> _listRoom;
  @override
  List<RoomEntities> get listRoom {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRoom);
  }

  @override
  String toString() {
    return 'AddDeviceToRoomState(roomSelector: $roomSelector, listRoom: $listRoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddDeviceToRoomState &&
            const DeepCollectionEquality()
                .equals(other.roomSelector, roomSelector) &&
            const DeepCollectionEquality().equals(other._listRoom, _listRoom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(roomSelector),
      const DeepCollectionEquality().hash(_listRoom));

  @JsonKey(ignore: true)
  @override
  _$$_AddDeviceToRoomStateCopyWith<_$_AddDeviceToRoomState> get copyWith =>
      __$$_AddDeviceToRoomStateCopyWithImpl<_$_AddDeviceToRoomState>(
          this, _$identity);
}

abstract class _AddDeviceToRoomState extends AddDeviceToRoomState {
  factory _AddDeviceToRoomState(
      {required final RoomEntities roomSelector,
      required final List<RoomEntities> listRoom}) = _$_AddDeviceToRoomState;
  _AddDeviceToRoomState._() : super._();

  @override
  RoomEntities get roomSelector;
  @override
  List<RoomEntities> get listRoom;
  @override
  @JsonKey(ignore: true)
  _$$_AddDeviceToRoomStateCopyWith<_$_AddDeviceToRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}
