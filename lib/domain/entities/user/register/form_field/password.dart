import 'package:formz/formz.dart';

import '../../../../../injection/injector.dart';
import '../../../../../utilities/helpers/validator_helper/validator_helper.dart';

enum PasswordValidationError {
  pure,
  empty,
  invalid,
}

extension PasswordValidationErrorExtension on PasswordValidationError {
  String? get description {
    switch (this) {
      case PasswordValidationError.pure:
        return null;
      case PasswordValidationError.empty:
        return 'The password is required';
      case PasswordValidationError.invalid:
        return 'The password is invalid';
    }
  }
}

class Password extends FormzInput<String?, PasswordValidationError> {
  Password.pure() : super.pure(null);

  Password.dirty([String value = '']) : super.dirty(value);

  final validatorHelper = injector.get<ValidatorHelper>();

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null) {
      return PasswordValidationError.pure;
    } else if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (validatorHelper.isPassword(value)) {
      return null;
    } else {
      return PasswordValidationError.invalid;
    }
  }
}
