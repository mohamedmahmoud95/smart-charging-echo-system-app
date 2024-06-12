class AuthInputValidator {
  static bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool validatePassword(String password) {
    bool passwordIsValid = true;
    if (password.isEmpty) {
      passwordIsValid = true;
    }

    if (password.length < 6) {
      passwordIsValid = false;
    }

    if (password.contains(RegExp(r'[a-z]')) == false) {
      passwordIsValid = false;
    }
    if (password.contains(RegExp(r'[A-Z]')) == false) {
      passwordIsValid = false;
    }
    if (password.contains(RegExp(r'[0-9]')) == false) {
      passwordIsValid = false;
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      passwordIsValid = false;
    }
    //  if isValidPassword made it to this point without being changed to false, then it's still true
    //hence, the password is valid
    return passwordIsValid;
  }


  static bool validatePasswordsAreMatched(String password1, String password2) {
    return password1 == password2;
  }
}
