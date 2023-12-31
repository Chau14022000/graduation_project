// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyHomeState {
  int get selectedIndex => throw _privateConstructorUsedError;
  UserEntities get account => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyHomeStateCopyWith<MyHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyHomeStateCopyWith<$Res> {
  factory $MyHomeStateCopyWith(
          MyHomeState value, $Res Function(MyHomeState) then) =
      _$MyHomeStateCopyWithImpl<$Res>;
  $Res call({int selectedIndex, UserEntities account});
}

/// @nodoc
class _$MyHomeStateCopyWithImpl<$Res> implements $MyHomeStateCopyWith<$Res> {
  _$MyHomeStateCopyWithImpl(this._value, this._then);

  final MyHomeState _value;
  // ignore: unused_field
  final $Res Function(MyHomeState) _then;

  @override
  $Res call({
    Object? selectedIndex = freezed,
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UserEntities,
    ));
  }
}

/// @nodoc
abstract class _$$_MyHomeStateCopyWith<$Res>
    implements $MyHomeStateCopyWith<$Res> {
  factory _$$_MyHomeStateCopyWith(
          _$_MyHomeState value, $Res Function(_$_MyHomeState) then) =
      __$$_MyHomeStateCopyWithImpl<$Res>;
  @override
  $Res call({int selectedIndex, UserEntities account});
}

/// @nodoc
class __$$_MyHomeStateCopyWithImpl<$Res> extends _$MyHomeStateCopyWithImpl<$Res>
    implements _$$_MyHomeStateCopyWith<$Res> {
  __$$_MyHomeStateCopyWithImpl(
      _$_MyHomeState _value, $Res Function(_$_MyHomeState) _then)
      : super(_value, (v) => _then(v as _$_MyHomeState));

  @override
  _$_MyHomeState get _value => super._value as _$_MyHomeState;

  @override
  $Res call({
    Object? selectedIndex = freezed,
    Object? account = freezed,
  }) {
    return _then(_$_MyHomeState(
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UserEntities,
    ));
  }
}

/// @nodoc

class _$_MyHomeState extends _MyHomeState {
  _$_MyHomeState({required this.selectedIndex, required this.account})
      : super._();

  @override
  final int selectedIndex;
  @override
  final UserEntities account;

  @override
  String toString() {
    return 'MyHomeState(selectedIndex: $selectedIndex, account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyHomeState &&
            const DeepCollectionEquality()
                .equals(other.selectedIndex, selectedIndex) &&
            const DeepCollectionEquality().equals(other.account, account));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedIndex),
      const DeepCollectionEquality().hash(account));

  @JsonKey(ignore: true)
  @override
  _$$_MyHomeStateCopyWith<_$_MyHomeState> get copyWith =>
      __$$_MyHomeStateCopyWithImpl<_$_MyHomeState>(this, _$identity);
}

abstract class _MyHomeState extends MyHomeState {
  factory _MyHomeState(
      {required final int selectedIndex,
      required final UserEntities account}) = _$_MyHomeState;
  _MyHomeState._() : super._();

  @override
  int get selectedIndex;
  @override
  UserEntities get account;
  @override
  @JsonKey(ignore: true)
  _$$_MyHomeStateCopyWith<_$_MyHomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
