import 'package:uniform/uniform.dart';
import 'package:easy_localization/easy_localization.dart';
import '../localization/locale_keys.g.dart';

/// Validator for name field
/// 
/// Validates that:
/// - Name is not empty
/// - Name contains only letters and spaces
/// - Name is at least 2 characters long
class NameValidator implements InputFieldValidator {
  const NameValidator();

  @override
  InputFieldError resolve(Object? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return InputFieldError(LocaleKeys.login_validation_nameRequired.tr());
    }

    final stringValue = value.toString().trim();

    if (stringValue.length < 2) {
      return InputFieldError(LocaleKeys.login_validation_nameMinLength.tr());
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s]+$");
    if (!nameRegex.hasMatch(stringValue)) {
      return InputFieldError(LocaleKeys.login_validation_nameLettersOnly.tr());
    }

    return InputFieldError.none();
  }
}

