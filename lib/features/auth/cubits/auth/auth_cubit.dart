import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hollo/core/core.dart';

import '../../repositories/repositories.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository})
      : super(
          const AuthState(authStatus: ViewState.initial()),
        );

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

      //TODO: Handle save credential to local storage
      emit(state.copyWith(authStatus: const ViewState.success()));
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

      //TODO: Handle save credential to local storage
      emit(state.copyWith(authStatus: const ViewState.success()));
    } catch (e) {
      emit(state.copyWith(authStatus: const ViewState.failed()));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(authStatus: const ViewState.loading()));
    try {
      //TODO: Handle remove credential from local storage

      await repository.logout();
      emit(state.copyWith(authStatus: const ViewState.success()));
    } catch (e) {
      emit(state.copyWith(authStatus: const ViewState.failed()));
    }
  }
}
