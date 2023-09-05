// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config_wifi_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConfigWifiState {
  bool get statusButton => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigWifiStateCopyWith<ConfigWifiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigWifiStateCopyWith<$Res> {
  factory $ConfigWifiStateCopyWith(
          ConfigWifiState value, $Res Function(ConfigWifiState) then) =
      _$ConfigWifiStateCopyWithImpl<$Res>;
  $Res call({bool statusButton});
}

/// @nodoc
class _$ConfigWifiStateCopyWithImpl<$Res>
    implements $ConfigWifiStateCopyWith<$Res> {
  _$ConfigWifiStateCopyWithImpl(this._value, this._then);

  final ConfigWifiState _value;
  // ignore: unused_field
  final $Res Function(ConfigWifiState) _then;

  @override
  $Res call({
    Object? statusButton = freezed,
  }) {
    return _then(_value.copyWith(
      statusButton: statusButton == freezed
          ? _value.statusButton
          : statusButton // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ConfigWifiStateCopyWith<$Res>
    implements $ConfigWifiStateCopyWith<$Res> {
  factory _$$_ConfigWifiStateCopyWith(
          _$_ConfigWifiState value, $Res Function(_$_ConfigWifiState) then) =
      __$$_ConfigWifiStateCopyWithImpl<$Res>;
  @override
  $Res call({bool statusButton});
}

/// @nodoc
class __$$_ConfigWifiStateCopyWithImpl<$Res>
    extends _$ConfigWifiStateCopyWithImpl<$Res>
    implements _$$_ConfigWifiStateCopyWith<$Res> {
  __$$_ConfigWifiStateCopyWithImpl(
      _$_ConfigWifiState _value, $Res Function(_$_ConfigWifiState) _then)
      : super(_value, (v) => _then(v as _$_ConfigWifiState));

  @override
  _$_ConfigWifiState get _value => super._value as _$_ConfigWifiState;

  @override
  $Res call({
    Object? statusButton = freezed,
  }) {
    return _then(_$_ConfigWifiState(
      statusButton: statusButton == freezed
          ? _value.statusButton
          : statusButton // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ConfigWifiState extends _ConfigWifiState {
  _$_ConfigWifiState({required this.statusButton}) : super._();

  @override
  final bool statusButton;

  @override
  String toString() {
    return 'ConfigWifiState(statusButton: $statusButton)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfigWifiState &&
            const DeepCollectionEquality()
                .equals(other.statusButton, statusButton));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(statusButton));

  @JsonKey(ignore: true)
  @override
  _$$_ConfigWifiStateCopyWith<_$_ConfigWifiState> get copyWith =>
      __$$_ConfigWifiStateCopyWithImpl<_$_ConfigWifiState>(this, _$identity);
}

abstract class _ConfigWifiState extends ConfigWifiState {
  factory _ConfigWifiState({required final bool statusButton}) =
      _$_ConfigWifiState;
  _ConfigWifiState._() : super._();

  @override
  bool get statusButton;
  @override
  @JsonKey(ignore: true)
  _$$_ConfigWifiStateCopyWith<_$_ConfigWifiState> get copyWith =>
      throw _privateConstructorUsedError;
}
