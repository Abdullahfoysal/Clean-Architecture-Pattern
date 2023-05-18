import 'package:email_validator/email_validator.dart';

class FormValidator {
  static String? name(String? name) {
    if (isNullOrEmpty(name)) return "Please enter company name";
    return null;
  }

  static String? email(String? email) {
    if (isNullOrEmpty(email) || EmailValidator.validate(email ?? "") == false)
      return "Please enter correct email";
    return null;
  }

  static String? password(String? pass) {
    if (isNullOrEmpty(pass) || (pass != null && pass.length < 6))
      return "Please enter at least 6 character password";
    return null;
  }

  static String? phone(String? number) {
    if (isNullOrEmpty(number) || (number != null && number.length != 11))
      return "Please enter correct 11 digit phone number";
    return null;
  }

  static isNullOrEmpty(String? text) {
    return (text == null || text.trim().isEmpty || text.trim() == '');
  }
}
