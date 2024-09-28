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


  static Future<String> userSignIn(String email, String password) async {
    String msg;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      msg = 'Success';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          msg = 'Wrong password';
          break;
        case 'invalid-email':
          msg = 'Email is invalid';
          break;
        case 'user-not-found':
          msg = 'This email does not exist';
          break;
        default:
          msg = e.code;
      }
    }
    return msg;
  }
}
