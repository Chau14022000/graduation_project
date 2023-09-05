// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  RoomEntities get roomSelector => throw _privateConstructorUsedError;
  String get getResult => throw _privateConstructorUsedError;
  List<RoomEntities> get listRoom => throw _privateConstructorUsedError;
  List<DeviceEntities> get listDevice => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {RoomEntities roomSelector,
      String getResult,
      List<RoomEntities> listRoom,
      List<DeviceEntities> listDevice,
      String? avatar});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? roomSelector = freezed,
    Object? getResult = freezed,
    Object? listRoom = freezed,
    Object? listDevice = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      roomSelector: roomSelector == freezed
          ? _value.roomSelector
          : roomSelector // ignore: cast_nullable_to_non_nullable
              as RoomEntities,
      getResult: getResult == freezed
          ? _value.getResult
          : getResult // ignore: cast_nullable_to_non_nullable
              as String,
      listRoom: listRoom == freezed
          ? _value.listRoom
          : listRoom // ignore: cast_nullable_to_non_nullable
              as List<RoomEntities>,
      listDevice: listDevice == freezed
          ? _value.listDevice
          : listDevice // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntities>,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoomEntities roomSelector,
      String getResult,
      List<RoomEntities> listRoom,
      List<DeviceEntities> listDevice,
      String? avatar});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, (v) => _then(v as _$_HomeState));

  @override
  _$_HomeState get _value => super._value as _$_HomeState;

  @override
  $Res call({
    Object? roomSelector = freezed,
    Object? getResult = freezed,
    Object? listRoom = freezed,
    Object? listDevice = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$_HomeState(
      roomSelector: roomSelector == freezed
          ? _value.roomSelector
          : roomSelector // ignore: cast_nullable_to_non_nullable
              as RoomEntities,
      getResult: getResult == freezed
          ? _value.getResult
          : getResult // ignore: cast_nullable_to_non_nullable
              as String,
      listRoom: listRoom == freezed
          ? _value._listRoom
          : listRoom // ignore: cast_nullable_to_non_nullable
              as List<RoomEntities>,
      listDevice: listDevice == freezed
          ? _value._listDevice
          : listDevice // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntities>,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  _$_HomeState(
      {required this.roomSelector,
      required this.getResult,
      required final List<RoomEntities> listRoom,
      required final List<DeviceEntities> listDevice,
      this.avatar})
      : _listRoom = listRoom,
        _listDevice = listDevice,
        super._();

  @override
  final RoomEntities roomSelector;
  @override
  final String getResult;
  final List<RoomEntities> _listRoom;
  @override
  List<RoomEntities> get listRoom {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRoom);
  }

  final List<DeviceEntities> _listDevice;
  @override
  List<DeviceEntities> get listDevice {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listDevice);
  }

  @override
  final String? avatar;

  @override
  String toString() {
    return 'HomeState(roomSelector: $roomSelector, getResult: $getResult, listRoom: $listRoom, listDevice: $listDevice, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other.roomSelector, roomSelector) &&
            const DeepCollectionEquality().equals(other.getResult, getResult) &&
            const DeepCollectionEquality().equals(other._listRoom, _listRoom) &&
            const DeepCollectionEquality()
                .equals(other._listDevice, _listDevice) &&
            const DeepCollectionEquality().equals(other.avatar, avatar));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(roomSelector),
      const DeepCollectionEquality().hash(getResult),
      const DeepCollectionEquality().hash(_listRoom),
      const DeepCollectionEquality().hash(_listDevice),
      const DeepCollectionEquality().hash(avatar));

  @JsonKey(ignore: true)
  @override
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  factory _HomeState(
      {required final RoomEntities roomSelector,
      required final String getResult,
      required final List<RoomEntities> listRoom,
      required final List<DeviceEntities> listDevice,
      final String? avatar}) = _$_HomeState;
  _HomeState._() : super._();

  @override
  RoomEntities get roomSelector;
  @override
  String get getResult;
  @override
  List<RoomEntities> get listRoom;
  @override
  List<DeviceEntities> get listDevice;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
