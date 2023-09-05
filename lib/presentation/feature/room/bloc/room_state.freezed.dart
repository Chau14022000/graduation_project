// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomState {
  RoomEntities get roomEntities => throw _privateConstructorUsedError;
  List<DeviceEntities> get listDevice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomStateCopyWith<RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res>;
  $Res call({RoomEntities roomEntities, List<DeviceEntities> listDevice});
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res> implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  final RoomState _value;
  // ignore: unused_field
  final $Res Function(RoomState) _then;

  @override
  $Res call({
    Object? roomEntities = freezed,
    Object? listDevice = freezed,
  }) {
    return _then(_value.copyWith(
      roomEntities: roomEntities == freezed
          ? _value.roomEntities
          : roomEntities // ignore: cast_nullable_to_non_nullable
              as RoomEntities,
      listDevice: listDevice == freezed
          ? _value.listDevice
          : listDevice // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntities>,
    ));
  }
}

/// @nodoc
abstract class _$$_RoomStateCopyWith<$Res> implements $RoomStateCopyWith<$Res> {
  factory _$$_RoomStateCopyWith(
          _$_RoomState value, $Res Function(_$_RoomState) then) =
      __$$_RoomStateCopyWithImpl<$Res>;
  @override
  $Res call({RoomEntities roomEntities, List<DeviceEntities> listDevice});
}

/// @nodoc
class __$$_RoomStateCopyWithImpl<$Res> extends _$RoomStateCopyWithImpl<$Res>
    implements _$$_RoomStateCopyWith<$Res> {
  __$$_RoomStateCopyWithImpl(
      _$_RoomState _value, $Res Function(_$_RoomState) _then)
      : super(_value, (v) => _then(v as _$_RoomState));

  @override
  _$_RoomState get _value => super._value as _$_RoomState;

  @override
  $Res call({
    Object? roomEntities = freezed,
    Object? listDevice = freezed,
  }) {
    return _then(_$_RoomState(
      roomEntities: roomEntities == freezed
          ? _value.roomEntities
          : roomEntities // ignore: cast_nullable_to_non_nullable
              as RoomEntities,
      listDevice: listDevice == freezed
          ? _value._listDevice
          : listDevice // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntities>,
    ));
  }
}

/// @nodoc

class _$_RoomState extends _RoomState {
  _$_RoomState(
      {required this.roomEntities,
      required final List<DeviceEntities> listDevice})
      : _listDevice = listDevice,
        super._();

  @override
  final RoomEntities roomEntities;
  final List<DeviceEntities> _listDevice;
  @override
  List<DeviceEntities> get listDevice {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listDevice);
  }

  @override
  String toString() {
    return 'RoomState(roomEntities: $roomEntities, listDevice: $listDevice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomState &&
            const DeepCollectionEquality()
                .equals(other.roomEntities, roomEntities) &&
            const DeepCollectionEquality()
                .equals(other._listDevice, _listDevice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(roomEntities),
      const DeepCollectionEquality().hash(_listDevice));

  @JsonKey(ignore: true)
  @override
  _$$_RoomStateCopyWith<_$_RoomState> get copyWith =>
      __$$_RoomStateCopyWithImpl<_$_RoomState>(this, _$identity);
}

abstract class _RoomState extends RoomState {
  factory _RoomState(
      {required final RoomEntities roomEntities,
      required final List<DeviceEntities> listDevice}) = _$_RoomState;
  _RoomState._() : super._();

  @override
  RoomEntities get roomEntities;
  @override
  List<DeviceEntities> get listDevice;
  @override
  @JsonKey(ignore: true)
  _$$_RoomStateCopyWith<_$_RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}
