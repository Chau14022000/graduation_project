// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingState {
  bool get isLight => throw _privateConstructorUsedError;
  bool get isDark => throw _privateConstructorUsedError;
  UserEntities get userEntities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res>;
  $Res call({bool isLight, bool isDark, UserEntities userEntities});
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res> implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  final SettingState _value;
  // ignore: unused_field
  final $Res Function(SettingState) _then;

  @override
  $Res call({
    Object? isLight = freezed,
    Object? isDark = freezed,
    Object? userEntities = freezed,
  }) {
    return _then(_value.copyWith(
      isLight: isLight == freezed
          ? _value.isLight
          : isLight // ignore: cast_nullable_to_non_nullable
              as bool,
      isDark: isDark == freezed
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool,
      userEntities: userEntities == freezed
          ? _value.userEntities
          : userEntities // ignore: cast_nullable_to_non_nullable
              as UserEntities,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$$_SettingStateCopyWith(
          _$_SettingState value, $Res Function(_$_SettingState) then) =
      __$$_SettingStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLight, bool isDark, UserEntities userEntities});
}

/// @nodoc
class __$$_SettingStateCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res>
    implements _$$_SettingStateCopyWith<$Res> {
  __$$_SettingStateCopyWithImpl(
      _$_SettingState _value, $Res Function(_$_SettingState) _then)
      : super(_value, (v) => _then(v as _$_SettingState));

  @override
  _$_SettingState get _value => super._value as _$_SettingState;

  @override
  $Res call({
    Object? isLight = freezed,
    Object? isDark = freezed,
    Object? userEntities = freezed,
  }) {
    return _then(_$_SettingState(
      isLight: isLight == freezed
          ? _value.isLight
          : isLight // ignore: cast_nullable_to_non_nullable
              as bool,
      isDark: isDark == freezed
          ? _value.isDark
          : isDark // ignore: cast_nullable_to_non_nullable
              as bool,
      userEntities: userEntities == freezed
          ? _value.userEntities
          : userEntities // ignore: cast_nullable_to_non_nullable
              as UserEntities,
    ));
  }
}

/// @nodoc

class _$_SettingState extends _SettingState {
  _$_SettingState(
      {required this.isLight, required this.isDark, required this.userEntities})
      : super._();

  @override
  final bool isLight;
  @override
  final bool isDark;
  @override
  final UserEntities userEntities;

  @override
  String toString() {
    return 'SettingState(isLight: $isLight, isDark: $isDark, userEntities: $userEntities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingState &&
            const DeepCollectionEquality().equals(other.isLight, isLight) &&
            const DeepCollectionEquality().equals(other.isDark, isDark) &&
            const DeepCollectionEquality()
                .equals(other.userEntities, userEntities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLight),
      const DeepCollectionEquality().hash(isDark),
      const DeepCollectionEquality().hash(userEntities));

  @JsonKey(ignore: true)
  @override
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      __$$_SettingStateCopyWithImpl<_$_SettingState>(this, _$identity);
}

abstract class _SettingState extends SettingState {
  factory _SettingState(
      {required final bool isLight,
      required final bool isDark,
      required final UserEntities userEntities}) = _$_SettingState;
  _SettingState._() : super._();

  @override
  bool get isLight;
  @override
  bool get isDark;
  @override
  UserEntities get userEntities;
  @override
  @JsonKey(ignore: true)
  _$$_SettingStateCopyWith<_$_SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
