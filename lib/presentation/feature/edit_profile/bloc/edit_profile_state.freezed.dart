// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfileState {
  Username get username => throw _privateConstructorUsedError;
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  UserEntities get userEntities => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  String? get dropdownValue => throw _privateConstructorUsedError;
  String? get pathImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileStateCopyWith<EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res>;
  $Res call(
      {Username username,
      PhoneNumber phoneNumber,
      FormzStatus status,
      UserEntities userEntities,
      Object? error,
      String? dropdownValue,
      String? pathImage});
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  final EditProfileState _value;
  // ignore: unused_field
  final $Res Function(EditProfileState) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? userEntities = freezed,
    Object? error = freezed,
    Object? dropdownValue = freezed,
    Object? pathImage = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      userEntities: userEntities == freezed
          ? _value.userEntities
          : userEntities // ignore: cast_nullable_to_non_nullable
              as UserEntities,
      error: error == freezed ? _value.error : error,
      dropdownValue: dropdownValue == freezed
          ? _value.dropdownValue
          : dropdownValue // ignore: cast_nullable_to_non_nullable
              as String?,
      pathImage: pathImage == freezed
          ? _value.pathImage
          : pathImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_EditProfileStateCopyWith<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  factory _$$_EditProfileStateCopyWith(
          _$_EditProfileState value, $Res Function(_$_EditProfileState) then) =
      __$$_EditProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Username username,
      PhoneNumber phoneNumber,
      FormzStatus status,
      UserEntities userEntities,
      Object? error,
      String? dropdownValue,
      String? pathImage});
}

/// @nodoc
class __$$_EditProfileStateCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res>
    implements _$$_EditProfileStateCopyWith<$Res> {
  __$$_EditProfileStateCopyWithImpl(
      _$_EditProfileState _value, $Res Function(_$_EditProfileState) _then)
      : super(_value, (v) => _then(v as _$_EditProfileState));

  @override
  _$_EditProfileState get _value => super._value as _$_EditProfileState;

  @override
  $Res call({
    Object? username = freezed,
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? userEntities = freezed,
    Object? error = freezed,
    Object? dropdownValue = freezed,
    Object? pathImage = freezed,
  }) {
    return _then(_$_EditProfileState(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      userEntities: userEntities == freezed
          ? _value.userEntities
          : userEntities // ignore: cast_nullable_to_non_nullable
              as UserEntities,
      error: error == freezed ? _value.error : error,
      dropdownValue: dropdownValue == freezed
          ? _value.dropdownValue
          : dropdownValue // ignore: cast_nullable_to_non_nullable
              as String?,
      pathImage: pathImage == freezed
          ? _value.pathImage
          : pathImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EditProfileState extends _EditProfileState {
  _$_EditProfileState(
      {required this.username,
      required this.phoneNumber,
      required this.status,
      required this.userEntities,
      this.error,
      this.dropdownValue,
      this.pathImage})
      : super._();

  @override
  final Username username;
  @override
  final PhoneNumber phoneNumber;
  @override
  final FormzStatus status;
  @override
  final UserEntities userEntities;
  @override
  final Object? error;
  @override
  final String? dropdownValue;
  @override
  final String? pathImage;

  @override
  String toString() {
    return 'EditProfileState(username: $username, phoneNumber: $phoneNumber, status: $status, userEntities: $userEntities, error: $error, dropdownValue: $dropdownValue, pathImage: $pathImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfileState &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.userEntities, userEntities) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.dropdownValue, dropdownValue) &&
            const DeepCollectionEquality().equals(other.pathImage, pathImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(userEntities),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(dropdownValue),
      const DeepCollectionEquality().hash(pathImage));

  @JsonKey(ignore: true)
  @override
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      __$$_EditProfileStateCopyWithImpl<_$_EditProfileState>(this, _$identity);
}

abstract class _EditProfileState extends EditProfileState {
  factory _EditProfileState(
      {required final Username username,
      required final PhoneNumber phoneNumber,
      required final FormzStatus status,
      required final UserEntities userEntities,
      final Object? error,
      final String? dropdownValue,
      final String? pathImage}) = _$_EditProfileState;
  _EditProfileState._() : super._();

  @override
  Username get username;
  @override
  PhoneNumber get phoneNumber;
  @override
  FormzStatus get status;
  @override
  UserEntities get userEntities;
  @override
  Object? get error;
  @override
  String? get dropdownValue;
  @override
  String? get pathImage;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileStateCopyWith<_$_EditProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
