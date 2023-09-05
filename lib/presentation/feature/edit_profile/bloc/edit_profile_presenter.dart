import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../domain/entities/edit_profile/form_field/phone_number.dart';
import '../../../../domain/entities/edit_profile/form_field/username.dart';
import '../../../../domain/entities/user/user_entities.dart';
import '../../../../domain/use_cases/user/get_account_use_case.dart';
import '../../../../domain/use_cases/user/up_image_use_case.dart';
import '../../../../domain/use_cases/user/update_account_use_case.dart';
import 'edit_profile_state.dart';

class EditProfilePresenter extends Cubit<EditProfileState> {
  EditProfilePresenter(
    this._getAccountUseCase,
    this._upImage,
    this._updateAccount, {
    @visibleForTesting EditProfileState? state,
  }) : super(state ?? EditProfileState.initial());

  bool onChanged = false;

  final GetAccountUseCase _getAccountUseCase;
  final UpImageUseCase _upImage;
  final UpdateAccountUseCase _updateAccount;
  String? image;

  final List<String> gender = ['male', 'female'];

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController phoneNumberEditingController = TextEditingController();

  Future<void> initState() async {
    final user = await _getAccountUseCase.run();
    emit(
      state.copyWith(
        userEntities: user,
        dropdownValue: user.gender,
      ),
    );
    final username = Username.dirty(
      state.userEntities.name,
    );
    final phoneNumber = PhoneNumber.dirty(
      state.userEntities.phone,
    );

    usernameEditingController =
        TextEditingController(text: state.userEntities.name);
    phoneNumberEditingController = TextEditingController(
      text: state.userEntities.phone.toString(),
    );
    emit(
      state.copyWith(
        dropdownValue: state.userEntities.gender,
        phoneNumber: phoneNumber,
        username: username,
        status: Formz.validate(
          [
            username,
            phoneNumber,
          ],
        ),
      ),
    );
  }

  void resetImage(String? pathImage) {
    emit(
      state.copyWith(
        pathImage: pathImage ?? state.pathImage,
      ),
    );
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate(
          [
            username,
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

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate(
          [
            state.username,
            phoneNumber,
          ],
        ),
      ),
    );
  }

  void cancelEdit() {
    emit(
      state.copyWith(
        pathImage: null,
      ),
    );
  }

  Future<void> updateAccount() async {
    if (state.pathImage != null) {
      image = await _upImage.run(state.pathImage!);
    } else {
      image = state.userEntities.avatar;
    }
    await _updateAccount.run(
      UserEntities(
        email: state.userEntities.email,
        password: state.userEntities.password,
        phone: state.phoneNumber.value!,
        gender: state.dropdownValue!,
        name: state.username.value!,
        avatar: image,
        id: state.userEntities.id,
        devices: state.userEntities.devices,
        rooms: state.userEntities.rooms,
      ),
    );
  }
}
