import 'package:formz/formz.dart';

import '../../../../../injection/injector.dart';
import '../../../../../utilities/helpers/validator_helper/validator_helper.dart';

enum UsernameValidationError {
  pure,
  empty,
  invalid,
}

extension UsernameValidationErrorExtension on UsernameValidationError {
  String? get description {
    switch (this) {
      case UsernameValidationError.pure:
        return null;
      case UsernameValidationError.empty:
        return 'The name is required';
      case UsernameValidationError.invalid:
        return 'The name is invalid';
    }
  }
}

class Username extends FormzInput<String?, UsernameValidationError> {
  Username.pure() : super.pure(null);

  Username.dirty([String value = '']) : super.dirty(value);

  final validatorHelper = injector.get<ValidatorHelper>();

  @override
  UsernameValidationError? validator(String? value) {
    if (value == null) {
      return UsernameValidationError.pure;
    } else if (value.isEmpty) {
      return UsernameValidationError.empty;
    } else if (validatorHelper.isUsername(value)) {
      return null;
    } else {
      return UsernameValidationError.invalid;
    }
  }
}
