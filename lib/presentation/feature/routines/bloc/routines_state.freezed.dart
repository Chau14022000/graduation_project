// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'routines_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoutinesState {
  bool get onTap => throw _privateConstructorUsedError;
  List<RoutinesEntities> get listRoutines => throw _privateConstructorUsedError;
  List<RoutinesEntities> get listRoutinesToday =>
      throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutinesStateCopyWith<RoutinesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutinesStateCopyWith<$Res> {
  factory $RoutinesStateCopyWith(
          RoutinesState value, $Res Function(RoutinesState) then) =
      _$RoutinesStateCopyWithImpl<$Res>;
  $Res call(
      {bool onTap,
      List<RoutinesEntities> listRoutines,
      List<RoutinesEntities> listRoutinesToday,
      String? image});
}

/// @nodoc
class _$RoutinesStateCopyWithImpl<$Res>
    implements $RoutinesStateCopyWith<$Res> {
  _$RoutinesStateCopyWithImpl(this._value, this._then);

  final RoutinesState _value;
  // ignore: unused_field
  final $Res Function(RoutinesState) _then;

  @override
  $Res call({
    Object? onTap = freezed,
    Object? listRoutines = freezed,
    Object? listRoutinesToday = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      onTap: onTap == freezed
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as bool,
      listRoutines: listRoutines == freezed
          ? _value.listRoutines
          : listRoutines // ignore: cast_nullable_to_non_nullable
              as List<RoutinesEntities>,
      listRoutinesToday: listRoutinesToday == freezed
          ? _value.listRoutinesToday
          : listRoutinesToday // ignore: cast_nullable_to_non_nullable
              as List<RoutinesEntities>,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_RoutinesStateCopyWith<$Res>
    implements $RoutinesStateCopyWith<$Res> {
  factory _$$_RoutinesStateCopyWith(
          _$_RoutinesState value, $Res Function(_$_RoutinesState) then) =
      __$$_RoutinesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool onTap,
      List<RoutinesEntities> listRoutines,
      List<RoutinesEntities> listRoutinesToday,
      String? image});
}

/// @nodoc
class __$$_RoutinesStateCopyWithImpl<$Res>
    extends _$RoutinesStateCopyWithImpl<$Res>
    implements _$$_RoutinesStateCopyWith<$Res> {
  __$$_RoutinesStateCopyWithImpl(
      _$_RoutinesState _value, $Res Function(_$_RoutinesState) _then)
      : super(_value, (v) => _then(v as _$_RoutinesState));

  @override
  _$_RoutinesState get _value => super._value as _$_RoutinesState;

  @override
  $Res call({
    Object? onTap = freezed,
    Object? listRoutines = freezed,
    Object? listRoutinesToday = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_RoutinesState(
      onTap: onTap == freezed
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as bool,
      listRoutines: listRoutines == freezed
          ? _value._listRoutines
          : listRoutines // ignore: cast_nullable_to_non_nullable
              as List<RoutinesEntities>,
      listRoutinesToday: listRoutinesToday == freezed
          ? _value._listRoutinesToday
          : listRoutinesToday // ignore: cast_nullable_to_non_nullable
              as List<RoutinesEntities>,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RoutinesState extends _RoutinesState {
  _$_RoutinesState(
      {required this.onTap,
      required final List<RoutinesEntities> listRoutines,
      required final List<RoutinesEntities> listRoutinesToday,
      this.image})
      : _listRoutines = listRoutines,
        _listRoutinesToday = listRoutinesToday,
        super._();

  @override
  final bool onTap;
  final List<RoutinesEntities> _listRoutines;
  @override
  List<RoutinesEntities> get listRoutines {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRoutines);
  }

  final List<RoutinesEntities> _listRoutinesToday;
  @override
  List<RoutinesEntities> get listRoutinesToday {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRoutinesToday);
  }

  @override
  final String? image;

  @override
  String toString() {
    return 'RoutinesState(onTap: $onTap, listRoutines: $listRoutines, listRoutinesToday: $listRoutinesToday, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoutinesState &&
            const DeepCollectionEquality().equals(other.onTap, onTap) &&
            const DeepCollectionEquality()
                .equals(other._listRoutines, _listRoutines) &&
            const DeepCollectionEquality()
                .equals(other._listRoutinesToday, _listRoutinesToday) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(onTap),
      const DeepCollectionEquality().hash(_listRoutines),
      const DeepCollectionEquality().hash(_listRoutinesToday),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_RoutinesStateCopyWith<_$_RoutinesState> get copyWith =>
      __$$_RoutinesStateCopyWithImpl<_$_RoutinesState>(this, _$identity);
}

abstract class _RoutinesState extends RoutinesState {
  factory _RoutinesState(
      {required final bool onTap,
      required final List<RoutinesEntities> listRoutines,
      required final List<RoutinesEntities> listRoutinesToday,
      final String? image}) = _$_RoutinesState;
  _RoutinesState._() : super._();

  @override
  bool get onTap;
  @override
  List<RoutinesEntities> get listRoutines;
  @override
  List<RoutinesEntities> get listRoutinesToday;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_RoutinesStateCopyWith<_$_RoutinesState> get copyWith =>
      throw _privateConstructorUsedError;
}
