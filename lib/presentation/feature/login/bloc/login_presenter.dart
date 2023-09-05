import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/user/login/form_field/email.dart';
import '../../../../domain/entities/user/login/form_field/password.dart';
import '../../../../domain/entities/user/login/login_request_entities.dart';
import '../../../../domain/use_cases/user/login_use_case.dart';
import '../../../../domain/use_cases/user/save_access_token_use_case.dart';
import 'login_state.dart';

class LoginPresenter extends Cubit<LoginState> {
  LoginPresenter(
    this._loginUseCase,
    this._saveAccessTokenUseCase, {
    @visibleForTesting LoginState? state,
  }) : super(state ?? LoginState.initial());

  final SaveAccessTokenUseCase _saveAccessTokenUseCase;

  final LoginUseCase _loginUseCase;

  void initState() {}

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [
            email,
            state.password,
          ],
        ),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
          [
            state.email,
            password,
          ],
        ),
      ),
    );
  }

  Future<bool> login() async {
    try {
      final userResponse = await _loginUseCase.run(
        LoginRequestEntities(
          email: state.email.value ?? '',
          password: state.password.value ?? '',
        ),
      );
      if (userResponse == null) {
        return false;
      }
      await _saveAccessTokenUseCase.run(userResponse.token);
    } on Exception catch (_) {
      return false;
    }
    return true;
  }
}
