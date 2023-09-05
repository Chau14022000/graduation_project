// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  Email get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  Username get name => throw _privateConstructorUsedError;
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  ConfirmPassword get confirmPassword => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;
  String get dropdownValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
  $Res call(
      {Email email,
      Password password,
      Username name,
      PhoneNumber phoneNumber,
      ConfirmPassword confirmPassword,
      FormzStatus status,
      String dropdownValue});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? confirmPassword = freezed,
    Object? status = freezed,
    Object? dropdownValue = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Username,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      dropdownValue: dropdownValue == freezed
          ? _value.dropdownValue
          : dropdownValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
          _$_RegisterState value, $Res Function(_$_RegisterState) then) =
      __$$_RegisterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Email email,
      Password password,
      Username name,
      PhoneNumber phoneNumber,
      ConfirmPassword confirmPassword,
      FormzStatus status,
      String dropdownValue});
}

/// @nodoc
class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, (v) => _then(v as _$_RegisterState));

  @override
  _$_RegisterState get _value => super._value as _$_RegisterState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? confirmPassword = freezed,
    Object? status = freezed,
    Object? dropdownValue = freezed,
  }) {
    return _then(_$_RegisterState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Username,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      dropdownValue: dropdownValue == freezed
          ? _value.dropdownValue
          : dropdownValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterState extends _RegisterState {
  _$_RegisterState(
      {required this.email,
      required this.password,
      required this.name,
      required this.phoneNumber,
      required this.confirmPassword,
      required this.status,
      required this.dropdownValue})
      : super._();

  @override
  final Email email;
  @override
  final Password password;
  @override
  final Username name;
  @override
  final PhoneNumber phoneNumber;
  @override
  final ConfirmPassword confirmPassword;
  @override
  final FormzStatus status;
  @override
  final String dropdownValue;

  @override
  String toString() {
    return 'RegisterState(email: $email, password: $password, name: $name, phoneNumber: $phoneNumber, confirmPassword: $confirmPassword, status: $status, dropdownValue: $dropdownValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.confirmPassword, confirmPassword) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.dropdownValue, dropdownValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(confirmPassword),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(dropdownValue));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      __$$_RegisterStateCopyWithImpl<_$_RegisterState>(this, _$identity);
}

abstract class _RegisterState extends RegisterState {
  factory _RegisterState(
      {required final Email email,
      required final Password password,
      required final Username name,
      required final PhoneNumber phoneNumber,
      required final ConfirmPassword confirmPassword,
      required final FormzStatus status,
      required final String dropdownValue}) = _$_RegisterState;
  _RegisterState._() : super._();

  @override
  Email get email;
  @override
  Password get password;
  @override
  Username get name;
  @override
  PhoneNumber get phoneNumber;
  @override
  ConfirmPassword get confirmPassword;
  @override
  FormzStatus get status;
  @override
  String get dropdownValue;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
