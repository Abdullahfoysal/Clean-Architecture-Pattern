import 'package:email_validator/email_validator.dart';

class FormValidator {
  String? name(String? name) {
    if (isNullOrEmpty(name)) return "Please enter company name";
    return null;
  }

  String? email(String? email) {
    if (isNullOrEmpty(email) || EmailValidator.validate(email ?? "") == false)
      return "Please enter correct email";
    return null;
  }

  String? password(String? pass) {
    if (isNullOrEmpty(pass) || (pass != null && pass.length < 6))
      return "Please enter at least 6 character password";
    return null;
  }

  String? phone(String? number) {
    if (isNullOrEmpty(number) || (number != null && number.length != 11))
      return "Please enter correct BD phone number";
    return null;
  }

  isNullOrEmpty(String? text) {
    return (text == null || text.trim().isEmpty || text.trim() == '');
  }
}
