// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListDeviceState {
  List<String> get listIdDevice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListDeviceStateCopyWith<ListDeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListDeviceStateCopyWith<$Res> {
  factory $ListDeviceStateCopyWith(
          ListDeviceState value, $Res Function(ListDeviceState) then) =
      _$ListDeviceStateCopyWithImpl<$Res>;
  $Res call({List<String> listIdDevice});
}

/// @nodoc
class _$ListDeviceStateCopyWithImpl<$Res>
    implements $ListDeviceStateCopyWith<$Res> {
  _$ListDeviceStateCopyWithImpl(this._value, this._then);

  final ListDeviceState _value;
  // ignore: unused_field
  final $Res Function(ListDeviceState) _then;

  @override
  $Res call({
    Object? listIdDevice = freezed,
  }) {
    return _then(_value.copyWith(
      listIdDevice: listIdDevice == freezed
          ? _value.listIdDevice
          : listIdDevice // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceStateCopyWith<$Res>
    implements $ListDeviceStateCopyWith<$Res> {
  factory _$$_DeviceStateCopyWith(
          _$_DeviceState value, $Res Function(_$_DeviceState) then) =
      __$$_DeviceStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> listIdDevice});
}

/// @nodoc
class __$$_DeviceStateCopyWithImpl<$Res>
    extends _$ListDeviceStateCopyWithImpl<$Res>
    implements _$$_DeviceStateCopyWith<$Res> {
  __$$_DeviceStateCopyWithImpl(
      _$_DeviceState _value, $Res Function(_$_DeviceState) _then)
      : super(_value, (v) => _then(v as _$_DeviceState));

  @override
  _$_DeviceState get _value => super._value as _$_DeviceState;

  @override
  $Res call({
    Object? listIdDevice = freezed,
  }) {
    return _then(_$_DeviceState(
      listIdDevice: listIdDevice == freezed
          ? _value._listIdDevice
          : listIdDevice // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_DeviceState extends _DeviceState {
  _$_DeviceState({required final List<String> listIdDevice})
      : _listIdDevice = listIdDevice,
        super._();

  final List<String> _listIdDevice;
  @override
  List<String> get listIdDevice {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listIdDevice);
  }

  @override
  String toString() {
    return 'ListDeviceState(listIdDevice: $listIdDevice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceState &&
            const DeepCollectionEquality()
                .equals(other._listIdDevice, _listIdDevice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listIdDevice));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      __$$_DeviceStateCopyWithImpl<_$_DeviceState>(this, _$identity);
}

abstract class _DeviceState extends ListDeviceState {
  factory _DeviceState({required final List<String> listIdDevice}) =
      _$_DeviceState;
  _DeviceState._() : super._();

  @override
  List<String> get listIdDevice;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceStateCopyWith<_$_DeviceState> get copyWith =>
      throw _privateConstructorUsedError;
}
