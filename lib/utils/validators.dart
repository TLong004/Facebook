class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    if (!value.contains(RegExp(r'[A-Za-z]')) || !value.contains(RegExp(r'[0-9]'))) {
        return 'Password must contain letters and numbers';
      }
    if (!RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{6,}$')
        .hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    if (value.trim() != value) {
        return 'Password cannot start or end with whitespace';
      }
    return null;
  }

  static String? fullName(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your full name';
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != password) return 'Passwords do not match';
    return null;
  }
}