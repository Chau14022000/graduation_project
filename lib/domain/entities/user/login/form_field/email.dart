import 'package:formz/formz.dart';

import '../../../../../injection/injector.dart';
import '../../../../../utilities/helpers/validator_helper/validator_helper.dart';

enum EmailValidationError {
  pure,
  empty,
  invalid,
}

extension EmailValidationErrorExtension on EmailValidationError {
  String? get description {
    switch (this) {
      case EmailValidationError.pure:
        return null;
      case EmailValidationError.empty:
        return 'The email is required';
      case EmailValidationError.invalid:
        return 'The email is invalid';
    }
  }
}

class Email extends FormzInput<String?, EmailValidationError> {
  Email.pure() : super.pure(null);

  Email.dirty([String value = '']) : super.dirty(value);

  final validatorHelper = injector.get<ValidatorHelper>();

  @override
  EmailValidationError? validator(String? value) {
    if (value == null) {
      return EmailValidationError.pure;
    } else if (value.isEmpty) {
      return EmailValidationError.empty;
    } else if (validatorHelper.isEmail(value)) {
      return null;
    } else {
      return EmailValidationError.invalid;
    }
  }
}
