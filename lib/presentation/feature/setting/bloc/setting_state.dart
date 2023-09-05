import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../domain/entities/user/user_entities.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  factory SettingState({
    required bool isLight,
    required bool isDark,
    required UserEntities userEntities,
  }) = _SettingState;

  const SettingState._();

  factory SettingState.initial() => SettingState(
        isLight: true,
        isDark: false,
        userEntities: UserEntities.pure(),
      );
}
