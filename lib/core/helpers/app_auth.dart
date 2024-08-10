import 'package:firebase_auth/firebase_auth.dart';

class AppAuth {
  static Future<String> registerUser(String email, String password) async {
    String error = '';
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          error = 'Email is already in use';
          break;
        case 'invalid-email':
          error = 'Email is invalid';
          break;
        case 'weak-password':
          error = 'Weak password';
          break;
        default:
          error = e.code;
      }
      return error;
    }
    return error;
  }
}
