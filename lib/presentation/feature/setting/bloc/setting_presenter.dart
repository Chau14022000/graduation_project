import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/use_cases/user/clear_auth_preferences_use_case.dart';
import '../../../../../../domain/use_cases/user/get_account_use_case.dart';
import 'setting_state.dart';

class SettingPresenter extends Cubit<SettingState> {
  SettingPresenter(
    this._clearAuthPreferencesUseCase,
    this._getAccountUseCase, {
    @visibleForTesting SettingState? state,
  }) : super(state ?? SettingState.initial());

  final ClearAuthPreferencesUseCase _clearAuthPreferencesUseCase;
  final GetAccountUseCase _getAccountUseCase;

  Future<void> initState() async {
    final user = await _getAccountUseCase.run();
    emit(
      state.copyWith(userEntities: user),
    );
  }

  void onTapLight() {
    emit(
      state.copyWith(
        isLight: true,
        isDark: false,
      ),
    );
  }

  void onTapDark() {
    emit(
      state.copyWith(
        isLight: false,
        isDark: true,
      ),
    );
  }

  Future<void> signOut() async {
    await _clearAuthPreferencesUseCase.run();
  }
}
