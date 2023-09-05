import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/user/register/form_field/confirm_password.dart';
import '../../../../domain/entities/user/register/form_field/email.dart';
import '../../../../domain/entities/user/register/form_field/password.dart';
import '../../../../domain/entities/user/register/form_field/phone_number.dart';
import '../../../../domain/entities/user/register/form_field/username.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    required Email email,
    required Password password,
    required Username name,
    required PhoneNumber phoneNumber,
    required ConfirmPassword confirmPassword,
    required FormzStatus status,
    required String dropdownValue,
  }) = _RegisterState;

  const RegisterState._();

  factory RegisterState.initial() => RegisterState(
        email: Email.pure(),
        password: Password.pure(),
        name: Username.pure(),
        phoneNumber: PhoneNumber.pure(),
        confirmPassword: ConfirmPassword.pure(),
        dropdownValue: 'male',
        status: FormzStatus.pure,
      );
}
