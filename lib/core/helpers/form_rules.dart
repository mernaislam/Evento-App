import 'package:evento_app/core/helpers/app_regex.dart';

class FormRules {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    if(!AppRegex.isEmailValid(email)){
      return 'Invalid email address';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if(!AppRegex.isPasswordValid(password)){
      return 'Invalid email address';
    }
    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    if(!AppRegex.hasMinLength(name)){
      return 'Name should has at least 6 characters';
    }
    if(AppRegex.hasSpecialCharacter(name)){
      return 'Name should have no special characters';
    }
    return null;
  }
}