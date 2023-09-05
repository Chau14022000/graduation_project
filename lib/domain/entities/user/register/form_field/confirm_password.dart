import 'package:formz/formz.dart';

import '../../../../../injection/injector.dart';
import '../../../../../utilities/helpers/validator_helper/validator_helper.dart';

enum ConfirmPasswordValidationError {
  pure,
  empty,
  invalid,
}

extension ConfirmPasswordValidationErrorExtension
    on ConfirmPasswordValidationError {
  String? get description {
    switch (this) {
      case ConfirmPasswordValidationError.pure:
        return null;
      case ConfirmPasswordValidationError.empty:
        return 'The confirm password is required';
      case ConfirmPasswordValidationError.invalid:
        return 'The confirm password is invalid';
    }
  }
}

class ConfirmPassword
    extends FormzInput<String?, ConfirmPasswordValidationError> {
  ConfirmPassword.pure() : super.pure(null);

  ConfirmPassword.dirty(
    String value, {
    required this.value2,
  }) : super.dirty(value);

  String? value2;

  final validatorHelper = injector.get<ValidatorHelper>();

  @override
  ConfirmPasswordValidationError? validator(String? value) {
    if (value == null) {
      return ConfirmPasswordValidationError.pure;
    } else if (value.isEmpty) {
      return ConfirmPasswordValidationError.empty;
    } else if (validatorHelper.isConfirmPassword(
      value,
      value2 ?? '',
    )) {
      return null;
    } else {
      return ConfirmPasswordValidationError.invalid;
    }
  }
}
