import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hollo/core/core.dart';

import '../../repositories/repositories.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  final _firebaseAuth = FirebaseAuth.instance;

  AuthCubit({required this.repository})
      : super(
          const AuthState(authStatus: ViewState.initial()),
        );

  final _flutterStorage = const FlutterSecureStorage();
  FirebaseAuth get firebaseAuth => _firebaseAuth;

  void onBuild() async {
    final uid = await _flutterStorage.read(key: 'uid');
    if (uid != null) {
      emit(state.copyWith(isAuthenticated: true));
    } else {
      emit(state.copyWith(isAuthenticated: false));
    }
  }

  void onChangeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void onChangePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void resetState() {
    emit(state.copyWith(
      authStatus: const ViewState.initial(),
      email: '',
      password: '',
    ));
  }

  Future<void> login() async {
    emit(state.copyWith(authStatus: const ViewState.loading()));
    try {
      final credential = await repository.login(
        email: state.email,
        password: state.password,
      );
      await _flutterStorage.write(key: 'uid', value: credential.user?.uid);

      emit(state.copyWith(
        authStatus: const ViewState.success(),
        isAuthenticated: true,
      ));
    } catch (_) {
      emit(state.copyWith(authStatus: const ViewState.failed()));
    }
  }

  Future<void> register() async {
    emit(state.copyWith(authStatus: const ViewState.loading()));
    try {
      final credential = await repository.register(
        email: state.email,
        password: state.password,
      );
      await _flutterStorage.write(key: 'uid', value: credential.user?.uid);

      emit(state.copyWith(
        authStatus: const ViewState.success(),
        isAuthenticated: true,
      ));
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          authStatus: ViewState.failed(errorMessage: e.message),
        ),
      );
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(authStatus: const ViewState.loading()));
    try {
      await repository.logout();
      await _flutterStorage.deleteAll();

      emit(state.copyWith(
        authStatus: const ViewState.success(),
        isAuthenticated: false,
      ));
    } catch (e) {
      emit(state.copyWith(authStatus: const ViewState.failed()));
    }
  }
}
