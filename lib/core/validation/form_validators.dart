import 'package:reactive_forms/reactive_forms.dart';
import 'package:easy_localization/easy_localization.dart';
import '../localization/locale_keys.g.dart';

/// Custom validator for name field using reactive_forms
class NameRequiredValidator extends Validator<dynamic> {
  const NameRequiredValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == null || control.value.toString().trim().isEmpty) {
      return {'nameRequired': LocaleKeys.login_validation_nameRequired.tr()};
    }

    final stringValue = control.value.toString().trim();

    if (stringValue.length < 2) {
      return {'nameMinLength': LocaleKeys.login_validation_nameMinLength.tr()};
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s]+$");
    if (!nameRegex.hasMatch(stringValue)) {
      return {'nameLettersOnly': LocaleKeys.login_validation_nameLettersOnly.tr()};
    }

    return null;
  }
}

/// Custom validator for phone number field using reactive_forms
class PhoneRequiredValidator extends Validator<dynamic> {
  const PhoneRequiredValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == null || control.value.toString().trim().isEmpty) {
      return {'phoneRequired': LocaleKeys.login_validation_phoneRequired.tr()};
    }

    final cleanedPhone = control.value.toString().replaceAll(RegExp(r'[\s\-]'), '');

    final phoneRegex = RegExp(r'^[0-9]+$');
    if (!phoneRegex.hasMatch(cleanedPhone)) {
      return {'phoneDigitsOnly': LocaleKeys.login_validation_phoneDigitsOnly.tr()};
    }

    if (cleanedPhone.startsWith('0')) {
      if (cleanedPhone.length != 10) {
        return {'phoneLengthWith0': LocaleKeys.login_validation_phoneLengthWith0.tr()};
      }
    } else {
      if (cleanedPhone.length != 9) {
        return {'phoneLengthWithout0': LocaleKeys.login_validation_phoneLengthWithout0.tr()};
      }
    }

    return null;
  }
}

/// Custom validator for country field using reactive_forms
class CountryRequiredValidator extends Validator<dynamic> {
  const CountryRequiredValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == null || control.value.toString().trim().isEmpty) {
      return {'countryRequired': LocaleKeys.login_validation_countryRequired.tr()};
    }

    return null;
  }
}

/// Custom validator for OTP code using reactive_forms
class OtpRequiredValidator extends Validator<dynamic> {
  const OtpRequiredValidator();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == null || control.value.toString().trim().isEmpty) {
      return {'otpRequired': LocaleKeys.login_wrongCode.tr()};
    }

    final otpCode = control.value.toString().trim();

    final digitRegex = RegExp(r'^[0-9]+$');
    if (!digitRegex.hasMatch(otpCode)) {
      return {'otpInvalid': LocaleKeys.login_wrongCode.tr()};
    }

    if (otpCode.length != 4) {
      return {'otpLength': LocaleKeys.login_wrongCode.tr()};
    }

    return null;
  }
}

/// Helper to create validation messages map for all validators
Map<String, String Function(Object)> validationMessages() {
  return {
    'nameRequired': (error) => error.toString(),
    'nameMinLength': (error) => error.toString(),
    'nameLettersOnly': (error) => error.toString(),
    'phoneRequired': (error) => error.toString(),
    'phoneDigitsOnly': (error) => error.toString(),
    'phoneLengthWith0': (error) => error.toString(),
    'phoneLengthWithout0': (error) => error.toString(),
    'countryRequired': (error) => error.toString(),
    'otpRequired': (error) => error.toString(),
    'otpInvalid': (error) => error.toString(),
    'otpLength': (error) => error.toString(),
  };
}




