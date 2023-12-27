class EmptyStringValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Return null if the input is valid
  }

  static String? validateEmail(String value) {
    // Regular expression for basic email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value.isEmpty) {
      return 'This field cannot be empty';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Please Enter a valid email';
    }
    return null;
  }
}
