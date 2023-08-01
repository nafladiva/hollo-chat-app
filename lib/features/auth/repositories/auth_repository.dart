import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> login(
      {required String email, required String password});
  Future<UserCredential> register(
      {required String email, required String password, String? name});
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
    String? name,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// store to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user?.uid)
          .set({
        'uid': credential.user?.uid,
        'email': credential.user?.email,
        'name': name,
      });

      return credential;
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
    } on FirebaseAuthException catch (_) {
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
