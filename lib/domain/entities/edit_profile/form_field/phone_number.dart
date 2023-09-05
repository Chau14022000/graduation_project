import 'package:formz/formz.dart';

import '../../../../../injection/injector.dart';
import '../../../../../utilities/helpers/validator_helper/validator_helper.dart';

enum PhoneNumberValidationError {
  pure,
  empty,
  invalid,
}

extension PhoneNumberValidationErrorExtension on PhoneNumberValidationError {
  String? get description {
    switch (this) {
      case PhoneNumberValidationError.pure:
        return null;
      case PhoneNumberValidationError.empty:
        return 'The phone number is required';
      case PhoneNumberValidationError.invalid:
        return 'The phone number is invalid';
    }
  }
}

class PhoneNumber extends FormzInput<String?, PhoneNumberValidationError> {
  PhoneNumber.pure() : super.pure(null);

  PhoneNumber.dirty([String value = '']) : super.dirty(value);

  final validatorHelper = injector.get<ValidatorHelper>();

  @override
  PhoneNumberValidationError? validator(String? value) {
    if (value == null) {
      return PhoneNumberValidationError.pure;
    } else if (value.isEmpty) {
      return PhoneNumberValidationError.empty;
    } else if (validatorHelper.isPhoneNumber(value)) {
      return null;
    } else {
      return PhoneNumberValidationError.invalid;
    }
  }
}
