// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceState {
  DeviceEntities get deviceEntities => throw _privateConstructorUsedError;
  String get dropdownValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceStateCopyWith<DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceStateCopyWith<$Res> {
  factory $DeviceStateCopyWith(
          DeviceState value, $Res Function(DeviceState) then) =
      _$DeviceStateCopyWithImpl<$Res>;
  $Res call({DeviceEntities deviceEntities, String dropdownValue});

  $DeviceEntitiesCopyWith<$Res> get deviceEntities;
}

/// @nodoc
class _$DeviceStateCopyWithImpl<$Res> implements $DeviceStateCopyWith<$Res> {
  _$DeviceStateCopyWithImpl(this._value, this._then);

  final DeviceState _value;
  // ignore: unused_field
  final $Res Function(DeviceState) _then;

  @override
  $Res call({
    Object? deviceEntities = freezed,
    Object? dropdownValue = freezed,
  }) {
    return _then(_value.copyWith(
      deviceEntities: deviceEntities == freezed
          ? _value.deviceEntities
          : deviceEntities // ignore: cast_nullable_to_non_nullable
              as DeviceEntities,
      dropdownValue: dropdownValue == freezed
          ? _value.dropdownValue
          : dropdownValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $DeviceEntitiesCopyWith<$Res> get deviceEntities {
    return $DeviceEntitiesCopyWith<$Res>(_value.deviceEntities, (value) {
      return _then(_value.copyWith(deviceEntities: value));
    });
  }
}

/// @nodoc
abstract class _$$_DeviceStateCopyWith<$Res>
    implements $DeviceStateCopyWith<$Res> {
  factory _$$_DeviceStateCopyWith(
          _$_DeviceState value, $Res Function(_$_DeviceState) then) =
      __$$_DeviceStateCopyWithImpl<$Res>;
  @override
  $Res call({DeviceEntities deviceEntities, String dropdownValue});

  @override
  $DeviceEntitiesCopyWith<$Res> get deviceEntities;
}

/// @nodoc
class __$$_DeviceStateCopyWithImpl<$Res> extends _$DeviceStateCopyWithImpl<$Res>
    implements _$$_DeviceStateCopyWith<$Res> {
  __$$_DeviceStateCopyWithImpl(
      _$_DeviceState _value, $Res Function(_$_DeviceState) _then)
      : super(_value, (v) => _then(v as _$_DeviceState));

  @override
  _$_DeviceState get _value => super._value as _$_DeviceState;

  @override
  $Res call({
    Object? deviceEntities = freezed,
    Object? dropdownValue = freezed,
  }) {
    return _then(_$_DeviceState(
      deviceEntities: deviceEntities == freezed
          ? _value.deviceEntities
          : deviceEntities // ignore: cast_nullable_to_non_nullable
              as DeviceEntities,
      dropdownValue: dropdownValue == freezed
          ? _value.dropdownValue
          : dropdownValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceState extends _DeviceState {
  _$_DeviceState({required this.deviceEntities, required this.dropdownValue})
      : super._();

  @override
  final DeviceEntities deviceEntities;
  @override
  final String dropdownValue;

  @override
  String toString() {
    return 'DeviceState(deviceEntities: $deviceEntities, dropdownValue: $dropdownValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceState &&
            const DeepCollectionEquality()
                .equals(other.deviceEntities, deviceEntities) &&
            const DeepCollectionEquality()
                .equals(other.dropdownValue, dropdownValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(deviceEntities),
      const DeepCollectionEquality().hash(dropdownValue));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      __$$_DeviceStateCopyWithImpl<_$_DeviceState>(this, _$identity);
}

abstract class _DeviceState extends DeviceState {
  factory _DeviceState(
      {required final DeviceEntities deviceEntities,
      required final String dropdownValue}) = _$_DeviceState;
  _DeviceState._() : super._();

  @override
  DeviceEntities get deviceEntities;
  @override
  String get dropdownValue;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}
