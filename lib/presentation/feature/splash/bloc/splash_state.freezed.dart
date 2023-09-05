// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashState {
  int get pageCurrent => throw _privateConstructorUsedError;
  PageController get pageController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashStateCopyWith<SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res>;
  $Res call({int pageCurrent, PageController pageController});
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res> implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  final SplashState _value;
  // ignore: unused_field
  final $Res Function(SplashState) _then;

  @override
  $Res call({
    Object? pageCurrent = freezed,
    Object? pageController = freezed,
  }) {
    return _then(_value.copyWith(
      pageCurrent: pageCurrent == freezed
          ? _value.pageCurrent
          : pageCurrent // ignore: cast_nullable_to_non_nullable
              as int,
      pageController: pageController == freezed
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
    ));
  }
}

/// @nodoc
abstract class _$$_SplashStateCopyWith<$Res>
    implements $SplashStateCopyWith<$Res> {
  factory _$$_SplashStateCopyWith(
          _$_SplashState value, $Res Function(_$_SplashState) then) =
      __$$_SplashStateCopyWithImpl<$Res>;
  @override
  $Res call({int pageCurrent, PageController pageController});
}

/// @nodoc
class __$$_SplashStateCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$$_SplashStateCopyWith<$Res> {
  __$$_SplashStateCopyWithImpl(
      _$_SplashState _value, $Res Function(_$_SplashState) _then)
      : super(_value, (v) => _then(v as _$_SplashState));

  @override
  _$_SplashState get _value => super._value as _$_SplashState;

  @override
  $Res call({
    Object? pageCurrent = freezed,
    Object? pageController = freezed,
  }) {
    return _then(_$_SplashState(
      pageCurrent: pageCurrent == freezed
          ? _value.pageCurrent
          : pageCurrent // ignore: cast_nullable_to_non_nullable
              as int,
      pageController: pageController == freezed
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
    ));
  }
}

/// @nodoc

class _$_SplashState extends _SplashState {
  _$_SplashState({required this.pageCurrent, required this.pageController})
      : super._();

  @override
  final int pageCurrent;
  @override
  final PageController pageController;

  @override
  String toString() {
    return 'SplashState(pageCurrent: $pageCurrent, pageController: $pageController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SplashState &&
            const DeepCollectionEquality()
                .equals(other.pageCurrent, pageCurrent) &&
            const DeepCollectionEquality()
                .equals(other.pageController, pageController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageCurrent),
      const DeepCollectionEquality().hash(pageController));

  @JsonKey(ignore: true)
  @override
  _$$_SplashStateCopyWith<_$_SplashState> get copyWith =>
      __$$_SplashStateCopyWithImpl<_$_SplashState>(this, _$identity);
}

abstract class _SplashState extends SplashState {
  factory _SplashState(
      {required final int pageCurrent,
      required final PageController pageController}) = _$_SplashState;
  _SplashState._() : super._();

  @override
  int get pageCurrent;
  @override
  PageController get pageController;
  @override
  @JsonKey(ignore: true)
  _$$_SplashStateCopyWith<_$_SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}
