import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign In
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCred.user;
    } catch (e) {
      print('Login Error: $e');
      return null;
    }
  }

  // Sign Up
  Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      print('Signup Error: ${e.code} - ${e.message}');
      return e.message; // return Firebase error
    } catch (e) {
      print('Unexpected Signup Error: $e');
      return 'Something went wrong. Try again.';
    }
  }


  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
