// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_routines_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateRoutinesState {
  bool get status => throw _privateConstructorUsedError;
  List<DeviceEntities?> get listDevice => throw _privateConstructorUsedError;
  List<bool> get chooseDays => throw _privateConstructorUsedError;
  bool get isEveryDay => throw _privateConstructorUsedError;
  List<bool> get onOffDevice => throw _privateConstructorUsedError;
  TimeOfDay? get startTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateRoutinesStateCopyWith<CreateRoutinesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoutinesStateCopyWith<$Res> {
  factory $CreateRoutinesStateCopyWith(
          CreateRoutinesState value, $Res Function(CreateRoutinesState) then) =
      _$CreateRoutinesStateCopyWithImpl<$Res>;
  $Res call(
      {bool status,
      List<DeviceEntities?> listDevice,
      List<bool> chooseDays,
      bool isEveryDay,
      List<bool> onOffDevice,
      TimeOfDay? startTime});
}

/// @nodoc
class _$CreateRoutinesStateCopyWithImpl<$Res>
    implements $CreateRoutinesStateCopyWith<$Res> {
  _$CreateRoutinesStateCopyWithImpl(this._value, this._then);

  final CreateRoutinesState _value;
  // ignore: unused_field
  final $Res Function(CreateRoutinesState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? listDevice = freezed,
    Object? chooseDays = freezed,
    Object? isEveryDay = freezed,
    Object? onOffDevice = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      listDevice: listDevice == freezed
          ? _value.listDevice
          : listDevice // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntities?>,
      chooseDays: chooseDays == freezed
          ? _value.chooseDays
          : chooseDays // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isEveryDay: isEveryDay == freezed
          ? _value.isEveryDay
          : isEveryDay // ignore: cast_nullable_to_non_nullable
              as bool,
      onOffDevice: onOffDevice == freezed
          ? _value.onOffDevice
          : onOffDevice // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateRoutinesStateCopyWith<$Res>
    implements $CreateRoutinesStateCopyWith<$Res> {
  factory _$$_CreateRoutinesStateCopyWith(_$_CreateRoutinesState value,
          $Res Function(_$_CreateRoutinesState) then) =
      __$$_CreateRoutinesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool status,
      List<DeviceEntities?> listDevice,
      List<bool> chooseDays,
      bool isEveryDay,
      List<bool> onOffDevice,
      TimeOfDay? startTime});
}

/// @nodoc
class __$$_CreateRoutinesStateCopyWithImpl<$Res>
    extends _$CreateRoutinesStateCopyWithImpl<$Res>
    implements _$$_CreateRoutinesStateCopyWith<$Res> {
  __$$_CreateRoutinesStateCopyWithImpl(_$_CreateRoutinesState _value,
      $Res Function(_$_CreateRoutinesState) _then)
      : super(_value, (v) => _then(v as _$_CreateRoutinesState));

  @override
  _$_CreateRoutinesState get _value => super._value as _$_CreateRoutinesState;

  @override
  $Res call({
    Object? status = freezed,
    Object? listDevice = freezed,
    Object? chooseDays = freezed,
    Object? isEveryDay = freezed,
    Object? onOffDevice = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_$_CreateRoutinesState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      listDevice: listDevice == freezed
          ? _value._listDevice
          : listDevice // ignore: cast_nullable_to_non_nullable
              as List<DeviceEntities?>,
      chooseDays: chooseDays == freezed
          ? _value._chooseDays
          : chooseDays // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      isEveryDay: isEveryDay == freezed
          ? _value.isEveryDay
          : isEveryDay // ignore: cast_nullable_to_non_nullable
              as bool,
      onOffDevice: onOffDevice == freezed
          ? _value._onOffDevice
          : onOffDevice // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc

class _$_CreateRoutinesState extends _CreateRoutinesState {
  _$_CreateRoutinesState(
      {required this.status,
      required final List<DeviceEntities?> listDevice,
      required final List<bool> chooseDays,
      required this.isEveryDay,
      required final List<bool> onOffDevice,
      this.startTime})
      : _listDevice = listDevice,
        _chooseDays = chooseDays,
        _onOffDevice = onOffDevice,
        super._();

  @override
  final bool status;
  final List<DeviceEntities?> _listDevice;
  @override
  List<DeviceEntities?> get listDevice {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listDevice);
  }

  final List<bool> _chooseDays;
  @override
  List<bool> get chooseDays {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chooseDays);
  }

  @override
  final bool isEveryDay;
  final List<bool> _onOffDevice;
  @override
  List<bool> get onOffDevice {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onOffDevice);
  }

  @override
  final TimeOfDay? startTime;

  @override
  String toString() {
    return 'CreateRoutinesState(status: $status, listDevice: $listDevice, chooseDays: $chooseDays, isEveryDay: $isEveryDay, onOffDevice: $onOffDevice, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateRoutinesState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._listDevice, _listDevice) &&
            const DeepCollectionEquality()
                .equals(other._chooseDays, _chooseDays) &&
            const DeepCollectionEquality()
                .equals(other.isEveryDay, isEveryDay) &&
            const DeepCollectionEquality()
                .equals(other._onOffDevice, _onOffDevice) &&
            const DeepCollectionEquality().equals(other.startTime, startTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_listDevice),
      const DeepCollectionEquality().hash(_chooseDays),
      const DeepCollectionEquality().hash(isEveryDay),
      const DeepCollectionEquality().hash(_onOffDevice),
      const DeepCollectionEquality().hash(startTime));

  @JsonKey(ignore: true)
  @override
  _$$_CreateRoutinesStateCopyWith<_$_CreateRoutinesState> get copyWith =>
      __$$_CreateRoutinesStateCopyWithImpl<_$_CreateRoutinesState>(
          this, _$identity);
}

abstract class _CreateRoutinesState extends CreateRoutinesState {
  factory _CreateRoutinesState(
      {required final bool status,
      required final List<DeviceEntities?> listDevice,
      required final List<bool> chooseDays,
      required final bool isEveryDay,
      required final List<bool> onOffDevice,
      final TimeOfDay? startTime}) = _$_CreateRoutinesState;
  _CreateRoutinesState._() : super._();

  @override
  bool get status;
  @override
  List<DeviceEntities?> get listDevice;
  @override
  List<bool> get chooseDays;
  @override
  bool get isEveryDay;
  @override
  List<bool> get onOffDevice;
  @override
  TimeOfDay? get startTime;
  @override
  @JsonKey(ignore: true)
  _$$_CreateRoutinesStateCopyWith<_$_CreateRoutinesState> get copyWith =>
      throw _privateConstructorUsedError;
}
