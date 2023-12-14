class ValidationInput {
  static bool validateEmail(String email) {
    String pattern =
        r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email.trim());
  }

  static bool validateNumber(String data) {
    String pattern = r'^[0-9]*$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(data.trim());
  }

  static bool validateNumberPhone(String data) {
    String pattern = r'^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(data.trim());
  }
}
