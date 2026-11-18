import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  // Singleton Pattern -> 1 Objek (Gunakan static agar tidak infinite loop/stack overflow)
  static final AuthServices _instance = AuthServices._internal();
  AuthServices._internal();
  factory AuthServices() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Status
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign UP
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print('Error Sign Up: $e');
      return null;
    }
  }

  // Sign In
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print('Error Sign In: $e');
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}