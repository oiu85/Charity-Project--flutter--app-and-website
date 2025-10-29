import 'package:uniform/uniform.dart';
import 'package:easy_localization/easy_localization.dart';
import '../localization/locale_keys.g.dart';

/// Validator for OTP code field
/// 
/// Validates that:
/// - OTP is not empty
/// - OTP contains only digits
/// - OTP is exactly 4 digits
/// - For design/testing: accepts "0000" as valid default code
class OtpValidator implements InputFieldValidator {
  const OtpValidator();

  @override
  InputFieldError resolve(Object? value) {
    if (value == null || value.toString().trim().isEmpty) {
      return InputFieldError(LocaleKeys.login_wrongCode.tr());
    }

    final otpCode = value.toString().trim();

    // Check if it contains only digits
    final digitRegex = RegExp(r'^[0-9]+$');
    if (!digitRegex.hasMatch(otpCode)) {
      return InputFieldError(LocaleKeys.login_wrongCode.tr());
    }

    // Check if it's exactly 4 digits
    if (otpCode.length != 4) {
      return InputFieldError(LocaleKeys.login_wrongCode.tr());
    }

    // For design/testing: "0000" is valid
    // In production, you would verify against backend
    if (otpCode == "0000") {
      return InputFieldError.none();
    }

    // TODO: Add backend verification here
    // For now, accept any 4-digit code
    return InputFieldError.none();
  }

  /// Validate OTP code directly
  static bool isValidOtp(String code) {
    if (code.isEmpty || code.length != 4) return false;
    final digitRegex = RegExp(r'^[0-9]+$');
    return digitRegex.hasMatch(code);
  }
}

