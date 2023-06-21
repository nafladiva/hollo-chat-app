import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> login(
      {required String email, required String password});
  Future<UserCredential> register(
      {required String email, required String password});
  Future<void> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  // User? get currentUser => _firebaseAuth.currentUser;
  // Stream<User?> get authStateChanged => _firebaseAuth.authStateChanges();

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
