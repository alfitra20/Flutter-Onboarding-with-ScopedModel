import 'package:flutter_onboarding_with_scopedmodel/assets/strings/strings.dart';

class InputValidators {
  // Funtion to validate the email input
  static String validateEmail(String value) {
    Pattern emailPattern = Strings.emailPattern;  
    RegExp emailRegex = new RegExp(emailPattern);
    if (!emailRegex.hasMatch(value)) {
      return Strings.invalidEmailAddressText;
    }
    return null;
  }

  // Function to validate the password input
  static String validatePassword(String value) {
    if (value.length >= 15) {
      return Strings.invalidPasswordText;
    } else if (value.length < 6) {
      return Strings.emptyPasswordText;
    }
    return null;
  }
  
}