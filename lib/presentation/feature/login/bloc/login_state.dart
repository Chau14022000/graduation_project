import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/user/login/form_field/email.dart';
import '../../../../domain/entities/user/login/form_field/password.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required Email email,
    required Password password,
    required FormzStatus status,
  }) = _LoginState;

  const LoginState._();

  factory LoginState.initial() => LoginState(
        email: Email.pure(),
        password: Password.pure(),
        status: FormzStatus.pure,
      );
}
