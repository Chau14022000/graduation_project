// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddRoomState {
  RoomEntities get roomSelector => throw _privateConstructorUsedError;
  List<RoomEntities> get listRoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddRoomStateCopyWith<AddRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddRoomStateCopyWith<$Res> {
  factory $AddRoomStateCopyWith(
          AddRoomState value, $Res Function(AddRoomState) then) =
      _$AddRoomStateCopyWithImpl<$Res>;
  $Res call({RoomEntities roomSelector, List<RoomEntities> listRoom});
}

/// @nodoc
class _$AddRoomStateCopyWithImpl<$Res> implements $AddRoomStateCopyWith<$Res> {
  _$AddRoomStateCopyWithImpl(this._value, this._then);

  final AddRoomState _value;
  // ignore: unused_field
  final $Res Function(AddRoomState) _then;

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
abstract class _$$_AddRoomStateCopyWith<$Res>
    implements $AddRoomStateCopyWith<$Res> {
  factory _$$_AddRoomStateCopyWith(
          _$_AddRoomState value, $Res Function(_$_AddRoomState) then) =
      __$$_AddRoomStateCopyWithImpl<$Res>;
  @override
  $Res call({RoomEntities roomSelector, List<RoomEntities> listRoom});
}

/// @nodoc
class __$$_AddRoomStateCopyWithImpl<$Res>
    extends _$AddRoomStateCopyWithImpl<$Res>
    implements _$$_AddRoomStateCopyWith<$Res> {
  __$$_AddRoomStateCopyWithImpl(
      _$_AddRoomState _value, $Res Function(_$_AddRoomState) _then)
      : super(_value, (v) => _then(v as _$_AddRoomState));

  @override
  _$_AddRoomState get _value => super._value as _$_AddRoomState;

  @override
  $Res call({
    Object? roomSelector = freezed,
    Object? listRoom = freezed,
  }) {
    return _then(_$_AddRoomState(
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

class _$_AddRoomState extends _AddRoomState {
  _$_AddRoomState(
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
    return 'AddRoomState(roomSelector: $roomSelector, listRoom: $listRoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddRoomState &&
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
  _$$_AddRoomStateCopyWith<_$_AddRoomState> get copyWith =>
      __$$_AddRoomStateCopyWithImpl<_$_AddRoomState>(this, _$identity);
}

abstract class _AddRoomState extends AddRoomState {
  factory _AddRoomState(
      {required final RoomEntities roomSelector,
      required final List<RoomEntities> listRoom}) = _$_AddRoomState;
  _AddRoomState._() : super._();

  @override
  RoomEntities get roomSelector;
  @override
  List<RoomEntities> get listRoom;
  @override
  @JsonKey(ignore: true)
  _$$_AddRoomStateCopyWith<_$_AddRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}
