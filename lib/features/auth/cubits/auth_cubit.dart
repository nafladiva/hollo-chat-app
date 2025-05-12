import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hollo/core/core.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void initial() async {
    await Future.delayed(const Duration(seconds: 3));
    _checkSession();
  }

  void _checkSession() {
    emit(state.copyWith(isCheckSession: true));
  }

  void onChangeName(String name) {}

  void onChangeEmail(String email) {}

  void onChangeUsername(String username) {}

  void onChangePassword(String password) {}

  void register() {}

  void login() {}

  void resetState() {}
}
