class EmptyStringValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Return null if the input is valid
  }
}
