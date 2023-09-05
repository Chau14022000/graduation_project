import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/edit_profile/form_field/phone_number.dart';
import '../../../../domain/entities/edit_profile/form_field/username.dart';
import '../../../../domain/entities/user/user_entities.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  factory EditProfileState({
    required Username username,
    required PhoneNumber phoneNumber,
    required FormzStatus status,
    required UserEntities userEntities,
    Object? error,
    String? dropdownValue,
    String? pathImage,
  }) = _EditProfileState;

  const EditProfileState._();

  factory EditProfileState.initial() => EditProfileState(
        username: Username.pure(),
        phoneNumber: PhoneNumber.pure(),
        userEntities: UserEntities.pure(),
        status: FormzStatus.pure,
      );
}
