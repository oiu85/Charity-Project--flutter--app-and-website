import 'package:uniform/uniform.dart';
import 'package:easy_localization/easy_localization.dart';
import '../localization/locale_keys.g.dart';

/// Validator for phone number field
/// 
/// Validates that:
/// - Phone number is not empty
/// - Phone number contains only digits
/// - Phone number is 10 digits if starts with 0, or 9 digits otherwise
class PhoneValidator implements InputFieldValidator {
  const PhoneValidator();

  @override
  InputFieldError resolve(Object? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return InputFieldError(LocaleKeys.login_validation_phoneRequired.tr());
    }

    // Remove spaces and dashes for validation
    final cleanedPhone = value.toString().replaceAll(RegExp(r'[\s\-]'), '');

    final phoneRegex = RegExp(r'^[0-9]+$');
    if (!phoneRegex.hasMatch(cleanedPhone)) {
      return InputFieldError(LocaleKeys.login_validation_phoneDigitsOnly.tr());
    }

    // Check length based on whether it starts with 0
    if (cleanedPhone.startsWith('0')) {
      if (cleanedPhone.length != 10) {
        return InputFieldError(LocaleKeys.login_validation_phoneLengthWith0.tr());
      }
    } else {
      if (cleanedPhone.length != 9) {
        return InputFieldError(LocaleKeys.login_validation_phoneLengthWithout0.tr());
      }
    }

    return InputFieldError.none();
  }
}

