import 'package:easy_localization/easy_localization.dart';
import 'package:uniform/uniform.dart';
import '../localization/locale_keys.g.dart';

/// Validator for country field
///
/// Validates that a country has been selected
class CountryValidator implements InputFieldValidator {
  const CountryValidator();

  @override
  InputFieldError resolve(Object? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return InputFieldError(LocaleKeys.login_validation_countryRequired.tr());
    }

    return InputFieldError.none();
  }
}
