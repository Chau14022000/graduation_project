import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../domain/entities/user/register/form_field/confirm_password.dart';
import '../../../../domain/entities/user/register/form_field/email.dart';
import '../../../../domain/entities/user/register/form_field/password.dart';
import '../../../../domain/entities/user/register/form_field/phone_number.dart';
import '../../../../domain/entities/user/register/form_field/username.dart';
import '../../../../domain/entities/user/register/register_request_entities.dart';
import '../../../../domain/use_cases/user/register_use_case.dart';
import 'register_state.dart';

class RegisterPresenter extends Cubit<RegisterState> {
  RegisterPresenter(
    this._registerUseCase, {
    @visibleForTesting RegisterState? state,
  }) : super(state ?? RegisterState.initial());

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool onChanged = false;
  final List<String> gender = ['male', 'female'];
  final RegisterUseCase _registerUseCase;

  void initState() {}

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        name: username,
        status: Formz.validate(
          [
            username,
            state.email,
            state.password,
            state.confirmPassword,
            state.phoneNumber,
          ],
        ),
      ),
    );
  }

  void genderChanged(String value) {
    emit(
      state.copyWith(
        dropdownValue: value,
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [
            state.name,
            email,
            state.password,
            state.confirmPassword,
            state.phoneNumber,
          ],
        ),
      ),
    );
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate(
          [
            state.name,
            state.email,
            phoneNumber,
            state.password,
          ],
        ),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmPassword = ConfirmPassword.dirty(
      confirmPasswordController.text,
      value2: value,
    );

    if (onChanged) {
      confirmPasswordChanged(
        confirmPasswordController.text,
      );
    }

    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
          [
            state.name,
            state.email,
            password,
            confirmPassword,
            state.phoneNumber
          ],
        ),
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    onChanged = true;
    final confirmPassword = ConfirmPassword.dirty(
      value,
      value2: passwordController.text,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        status: Formz.validate(
          [
            state.name,
            state.email,
            state.password,
            confirmPassword,
            state.phoneNumber,
          ],
        ),
      ),
    );
  }

  Future<bool> registerAccount() async {
    try {
      final userResponse = await _registerUseCase.run(
        RegisterRequestEntities(
          email: state.email.value ?? '',
          password: state.password.value ?? '',
          phone: state.phoneNumber.value ?? '',
          gender: state.dropdownValue,
          name: state.name.value ?? '',
          avatar: '',
        ),
      );
      if (userResponse == null) {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }

    return true;
  }
}
